#### Tutorial for random regression mixed models ####
#
# New Phytologist Supporting Information Notes S4
# Article title: How to analyse plant phenotypic plasticity in response to a changing climate
# Authors: Pieter A. Arnold, Loeske E. B. Kruuk and Adrienne B. Nicotra
# Article acceptance date: 10 December 2018
#

# Load in libraries
library(ggplot2)
library(MuMIn)
library(lme4)
# If lmer model p-values are desired then 'lmerTest' may be loaded in place of 'lme4'

# Read in data and check structure
flowerdata <- read.csv(file = "flowerdata.csv", header = TRUE, skip = 10)
head(flowerdata)
str(flowerdata)

# Convert genotype from integer to factor and check structure again
flowerdata$genotype <- as.factor(flowerdata$genotype)
flowerdata$loc <- as.factor(flowerdata$temperature)
str(flowerdata)

# Mean-centre the x variable (temperature)
# From here on, use the mean-centred temperature (ctemperature)
flowerdata$ctemperature <- scale(flowerdata$temperature)
head(flowerdata)

# Plot the main effects
ggplot(flowerdata, aes(x = ctemperature, y = relativedate, group = genotype)) +
  geom_line(aes(colour = genotype)) + ylab("Relative date of flowering") + 
  xlab("Mean-centred growth temperature") + theme_classic()

#### Basic linear model ####
# Fit a linear model for the fixed effect of growth temperature on relative date of flowering.
# Note that we also add a random effect for 'location' to take account of the 
# repeated measures at each temperature

model1.1 <- lmer(relativedate ~ ctemperature + (1|loc), REML = FALSE, data = flowerdata)

# Check model summary and R squared values
summary(model1.1)
r.squaredGLMM(model1.1)

# Predict values based on the model fit using the predict function
temperature_pred <- data.frame(ctemperature = seq(from = min(flowerdata$ctemperature),
                                                 to = max(flowerdata$ctemperature),
                                                 length.out = 50))
temperature_pred$fit1.1 <- predict(model1.1, newdata = temperature_pred, re.form = NA)

# Plot the raw data and overlay the fit of Model1.1
ggplot(temperature_pred, aes(x = ctemperature, y = fit1.1)) +
  geom_line(data = flowerdata, aes(y = relativedate, colour = genotype)) +
  geom_line(size = 2) +
  ylab("Relative date of flowering") + xlab("Mean-centred growth temperature") +
  theme_classic()


#### Quadratic fixed effects model ####
# Fit a quadratic model for the fixed effect of growth temperature on relative date of flowering
model1.2 <- lmer(relativedate ~ poly(ctemperature, 2, raw = T) + (1|loc), 
                 REML = FALSE, data = flowerdata)

# Check model summary and R squared values
summary(model1.2)
r.squaredGLMM(model1.2)

# Predict values based on the model fit using the predict function
temperature_pred$fit1.2 <- predict(model1.2, newdata = temperature_pred, re.form = NA)

# Plot the overall model fit over the top of the raw data 
ggplot(temperature_pred, aes(x = ctemperature, y = fit1.2)) +
  geom_line(data = flowerdata, aes(y = relativedate, colour = genotype)) +
  geom_line(size = 2) +
  ylab("Relative date of flowering") + xlab("Mean-centred growth temperature") +
  theme_classic()

# Are the two models different? 
# Likelihood ratio test
chi2 <- 2*(summary(model1.2)$logLik - summary(model1.1)$logLik)
1-pchisq(chi2,1)

# AIC comparison
AIC(model1.1, model1.2)


#### Quadratic fixed effects with random intercepts model ####
# Fit a linear mixed effects model (random intercepts only) for the fixed effect of 
# growth temperature on relative date of flowering and random effect of genotype intercepts
model1.3 <- lmer(relativedate ~ poly(ctemperature, 2, raw = T) + (1|loc) + (1|genotype), 
                 REML = FALSE, data = flowerdata)

# Check model summary and R squared values
summary(model1.3)
r.squaredGLMM(model1.3)

# Predict values based on the model fit using the predict function
temperature_pred$fit1.3 <- predict(model1.3, newdata = temperature_pred, re.form = NA)

# Make a prediction for the population-level mean reaction norm 
# and append it to the flowerdata dataset
flowerdata$pred_pop1.3  <- predict(model1.3, re.form = NA)
# Make predictions for each genotype-level reaction norm
flowerdata$pred_geno1.3 <- predict(model1.3, re.form = ~(1|genotype))

# Plot predicted genotype reaction norms over the raw data, along with the overall mean
ggplot(temperature_pred, aes(x = ctemperature, y = fit1.3)) +
  geom_line(data = flowerdata, aes(y = pred_geno1.3, group = genotype, colour = genotype), lty = 2) +
  geom_line(data = flowerdata,
            aes(y = relativedate, group = genotype, colour = genotype)) +
  geom_line(size = 2) +
  ylab("Relative date of flowering") + xlab("Mean-centred growth temperature") +
  theme_classic()

# Does adding genotype as a random intercept improve model fit?
# Likelihood ratio test
chi2 <- 2*(summary(model1.3)$logLik - summary(model1.2)$logLik)
1-pchisq(chi2, 1)

# AIC comparison
AIC(model1.1, model1.2, model1.3)


#### Quadratic fixed effects with linear random regression model ####
# Fit a linear mixed effects model for the fixed effect of growth temperature on 
# relative date of flowering and random effect of genotype intercepts and slopes
model1.4 <- lmer(relativedate ~ poly(ctemperature, 2, raw = T) + (1|loc) + (1+ctemperature|genotype), 
                 REML = FALSE, data = flowerdata)

# Check model summary and R squared values
summary(model1.4)
r.squaredGLMM(model1.4)

# Predict values based on the model fit using the predict function
temperature_pred$fit1.4 <- predict(model1.4, newdata = temperature_pred, re.form = NA)

# Make a prediction for the population-level mean reaction norm and append it to the flowerdata dataset
flowerdata$pred_pop1.4  <- predict(model1.4, re.form = NA)
# Make predictions for the genotype-level reaction norms
flowerdata$pred_geno1.4 <- predict(model1.4, re.form = ~(1+ctemperature|genotype))

# Plot predicted genotype reaction norms over the raw data, along with the overall mean
ggplot(temperature_pred, aes(x = ctemperature, y = fit1.4)) +
  geom_line(data = flowerdata, aes(y = pred_geno1.4, group = genotype, colour = genotype), lty = 2) +
  geom_line(data = flowerdata, aes(y = relativedate, group = genotype, colour = genotype)) +
  geom_line(size = 2) +
  ylab("Relative date of flowering") + xlab("Mean-centred growth temperature") +
  theme_classic()

# Does adding genotype as a random intercept and slope further improve model fit? 
# Likelihood ratio test
chi2 <- 2*(summary(model1.4)$logLik - summary(model1.3)$logLik)
# The df difference between models can be checked by looking at the df within the models being compared
summary(model1.3)$logLik
summary(model1.4)$logLik
# Note that between model1.3 and model1.4 there is a change of 2 df, so the 
# pchisq change needs to be specified with 2 df rather than 1 as in previous comparisons.
1-pchisq(chi2, 2)

# AIC comparison
AIC(model1.1, model1.2, model1.3, model1.4)


#### Quadratic fixed effects with quadratic random regression model ####
# Fit a linear mixed effects model for the fixed effect of growth temperature on 
# relative date of flowering and random effect of genotype intercepts, slopes, and curvature
model1.5 <- lmer(relativedate ~ poly(ctemperature, 2, raw = T) + (1|loc) +
                   (1 + ctemperature + I(ctemperature^2)|genotype), 
                 REML = FALSE, data = flowerdata)

# Check model summary and R squared values
summary(model1.5)
r.squaredGLMM(model1.5)

# Predict values based on the model fit using the predict function
temperature_pred$fit1.5 <- predict(model1.5, newdata = temperature_pred, re.form = NA)

# Make a prediction for the population-level mean reaction norm and append it to the flowerdata dataset
flowerdata$pred_pop1.5  <- predict(model1.5, re.form = NA)

# Unfortunately, to coerce the predict function to work for a complex random effect, 
# the model needs to be specified without the second random effect (1|loc)
model1.5a <- lmer(relativedate ~ poly(ctemperature, 2, raw = T) +
                    (1 + ctemperature + I(ctemperature^2)|genotype), 
                  REML = FALSE, data = flowerdata)

# We can check whether omitting the (1|loc) random effect changes the fixed effect
# coefficients greatly before interpreting the plot without it
summary(model1.5)$coef
summary(model1.5a)$coef

# Make predictions for the genotype-level reaction norms
flowerdata$pred_geno1.5 <- predict(model1.5a, re.form = NULL)

ggplot(temperature_pred, aes(x = ctemperature, y = fit1.5)) +
  geom_line(data = flowerdata, aes(y = pred_geno1.5, group = genotype, colour = genotype), lty = 2) +
  geom_line(data = flowerdata, aes(y = relativedate, group = genotype, colour = genotype)) +
  geom_line(size = 2) +
  ylab("Relative date of flowering") + xlab("Mean-centred growth temperature") +
  theme_classic()

# Does adding genotype as a random intercept, slope, and curvature further improve model fit? 
# Likelihood ratio test
chi2 <- 2*(summary(model1.5)$logLik - summary(model1.4)$logLik)
# The df difference between models can be checked by looking at the df within the models being compared
summary(model1.4)$logLik
summary(model1.5)$logLik
# Note that between model1.3 and model1.4 there is a change of 3 df, so the 
# pchisq change needs to be specified with 3 df rather than 1 or 2 as in previous comparisons.
1-pchisq(chi2, 3)

# AIC comparison
AIC(model1.1, model1.2, model1.3, model1.4, model1.5)


#### Best Linear Unbiased Predictors (BLUPs) to rank plasticity ####
# BLUPs represent the response of a given genotype to the fixed effect of temperature 
# as the difference between that genotype’s predicted response and the population-level 
# average predicted response. Here, we calculate and plot BLUPs for ranking plasticity.
genotype_blups <- ranef(model1.4)$`genotype`
genotype_index <- as.factor(c(1:20))
genotype_data  <- cbind(genotype_index, genotype_blups)
colnames(genotype_data) <- c("genotype", "BLUP_int", "BLUP_slope")

# BLUPs by intercept
ggplot(genotype_data, aes(genotype, BLUP_int)) + 
  geom_point(aes(group = genotype, colour = genotype), size = 4) + 
  ylab("BLUP intercept estimate") +
  geom_hline(yintercept = 0, lty = 2) + theme_classic()

# BLUPs by slope
ggplot(genotype_data, aes(genotype, BLUP_slope)) + 
  geom_point(aes(group = genotype, colour = genotype), size = 4) + 
  ylab("Plasticity (BLUP slope estimate)") +
  geom_hline(yintercept = 0, lty = 2) + theme_classic()

# Add the BLUP slopes for the genotypes to the population average
pop_av_slope <- fixef(model1.4)[2]
genotype_data$genotype_slopes <- genotype_blups$ctemperature + pop_av_slope

# BLUPs by slope + population-level average
ggplot(genotype_data, aes(genotype, genotype_slopes)) + 
  geom_point(aes(group = genotype, colour = genotype), size = 4) + 
  ylab("Plasticity (population-average + BLUP slope estimate)") +
  geom_hline(yintercept = 0, lty = 2) + theme_classic()

# Correlation between BLUP intercepts and slopes
ggplot(genotype_data, aes(BLUP_int, BLUP_slope)) +
  geom_point(aes(group = genotype, colour = genotype), size = 4) +
  xlab("BLUP intercept estimate") +
  ylab("BLUP slope estimate") +
  theme_classic()

# Rank the BLUPs in order
# Sort BLUPs by slope of most to least plastic
genotype_data$genotype_ordered <- factor(genotype_data$genotype, 
                                         levels = genotype_data$genotype[order(genotype_data$BLUP_slope)])
ggplot(genotype_data, aes(genotype_ordered, BLUP_slope)) +
  geom_bar(stat = "identity", aes(group = genotype, fill = genotype)) +
  xlab("Genotype (in ranked order of plasticity)") +
  ylab("Plasticity (BLUP slope estimate)") +
  theme_classic()

# Another way to visualise the plasticity rank for negative data is by adding
# the BLUP slope values to the population-level average effect of temperature
ggplot(genotype_data, aes(genotype_ordered, genotype_slopes)) +
  geom_bar(stat = "identity", aes(group = genotype, fill = genotype)) +
  xlab("Genotype (in ranked order of plasticity)") +
  ylab("Plasticity (population-average + BLUP slope estimate)") +
  theme_classic()

#### End ####