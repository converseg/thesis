# Install package from CRAN or GitHub
install.packages('ML2Pvae')
devtools::install_github('converseg/ML2Pvae')

# Load package
library(ML2Pvae)

# Load sample data (included in package)
data <- as.matrix(responses)
Q <- as.matrix(q_matrix)
cov_matrix <- as.matrix(correlation_matrix)

# Model parameters
num_items <- as.double(dim(Q)[2])
num_skills <- as.double(dim(Q)[1])
num_students <- dim(data)[1]
enc_arch <- c(16L, 8L)
enc_act <- c('relu', 'tanh')
out_act <- 'sigmoid'
(*@ \pagebreak @*)
# Build ML2P-VAE model assuming independent latent traits
models <- build_vae_correlated(
  num_items,
  num_skills,
  Q,
  covariance_matrix = cov_matrix,
  model_type = 2,
  enc_hid_arch = enc_arch,
  hid_enc_activation = enc_act,
  output_activation = out_act)
encoder <- models[[1]]
decoder <- models[[2]]
vae <- models[[3]]

# Training parameters
num_train <- floor(0.8 * num_students)
num_test <- num_students - num_train
data_train <- data[1:num_train,]
data_test <- data[(num_train + 1):num_students,]
num_epochs <- 15
batch_size <- 8

# Train neural network
history <- train_model(
  vae,
  data_train,
  num_epochs = num_epochs,
  batch_size = batch_size,
  verbose = 1)

# Get IRT parameter estimates 
item_param_estimates <- get_item_parameter_estimates(
  decoder, model_type = 2)
diff_est <- item_param_estimates[[1]]
disc_est <- item_param_estimates[[2]]
test_theta_est <- get_ability_parameter_estimates(
  encoder, data_test)[[1]]

# Load in true values (included in package)
true_diff <- as.matrix(diff_true)
true_disc <- as.matrix(disc_true)
true_theta<- as.matrix(theta_true)
true_theta_test <- theta_params_true[(num_train+1):num_students,]
(*@ \pagebreak @*)
# Plot estimates against true values
plot(true_diff, diff_est, pch = '*',
     main = 'Difficulty Parameters',
     xlab = 'True', ylab = 'Estimated')
matplot(t(true_disc), t(disc_est), pch = '*',
        main = 'Discrimination Parameters',
        xlab = 'True', ylab = 'Estimated')
matplot(true_theta_test, test_theta_est, pch = '*',
        main = 'Ability Parameters',
        xlab = 'True', ylab = 'Estimated')