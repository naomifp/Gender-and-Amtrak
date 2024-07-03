# ################################################################# #
#### LOAD LIBRARY AND DEFINE CORE SETTINGS                       ####
# ################################################################# #

### Clear memory
# rm(list = ls())

### Load Apollo library
library(apollo)

### Initialise code
apollo_initialise()

### Set core controls
apollo_control = list(
  modelName       = "MNL_access_mode_Amtrak",
  modelDescr      = "MNL on mode choice to access Davis Amtrak station with actual dataset",
  indivID         = "respid", 
  outputDirectory = "output"
)

# ################################################################# #
#### LOAD DATA AND APPLY ANY TRANSFORMATIONS                     ####
# ################################################################# #

### Loading data from package
### if data is to be loaded from a file (e.g. called data.csv), 
### the code would be: database = read.csv("data.csv",header=TRUE)

database = read.csv("amtrak_actual.csv",header=TRUE)


# ################################################################# #
#### DEFINE MODEL PARAMETERS                                     ####
# ################################################################# #

### Vector of parameters, including any that are kept fixed in estimation
apollo_beta=c(asc_drive   = 0,
              asc_pool    = 0,
              asc_pickup  = 0,
              asc_taxi    = 0,
              asc_transit = 0,
              asc_bike    = 0,
              asc_walk    = 0,
              
              beta_female_drive   = 0,
              beta_female_pool    = 0,
              beta_female_pickup  = 0,
              beta_female_taxi    = 0,
              beta_female_transit = 0,
              beta_female_bike    = 0,
              beta_female_walk    = 0,
              
              beta_age_drive      = 0,
              beta_age_pool       = 0,
              beta_age_pickup     = 0,
              beta_age_taxi       = 0,
              beta_age_transit    = 0,
              beta_age_bike       = 0,
              beta_age_walk       = 0,
              
              # beta_inc_under30k_drive    = 0,
              # beta_inc_under30k_pool     = 0,
              # beta_inc_under30k_pickup   = 0,
              # beta_inc_under30k_taxi     = 0,
              # beta_inc_under30k_transit  = 0,
              # beta_inc_under30k_bike     = 0,
              # beta_inc_under30k_walk     = 0,
              
              beta_inc_30k_75k_drive    = 0,
              beta_inc_30k_75k_pool     = 0,
              beta_inc_30k_75k_pickup   = 0,
              beta_inc_30k_75k_taxi     = 0,
              beta_inc_30k_75k_transit  = 0,
              beta_inc_30k_75k_bike     = 0,
              beta_inc_30k_75k_walk     = 0,

              beta_inc_75k_100k_drive    = 0,
              beta_inc_75k_100k_pool     = 0,
              beta_inc_75k_100k_pickup   = 0,
              beta_inc_75k_100k_taxi     = 0,
              beta_inc_75k_100k_transit  = 0,
              beta_inc_75k_100k_bike     = 0,
              beta_inc_75k_100k_walk     = 0,

              beta_inc_over100k_drive    = 0,
              beta_inc_over100k_pool     = 0,
              beta_inc_over100k_pickup   = 0,
              beta_inc_over100k_taxi     = 0,
              beta_inc_over100k_transit  = 0,
              beta_inc_over100k_bike     = 0,
              beta_inc_over100k_walk     = 0,
              
              beta_color_drive    = 0,
              beta_color_pool     = 0,
              beta_color_pickup   = 0,
              beta_color_taxi     = 0,
              beta_color_transit  = 0,
              beta_color_bike     = 0,
              beta_color_walk     = 0,

              beta_veh_drive      = 0,
              beta_veh_pool       = 0,
              beta_veh_pickup     = 0,
              beta_veh_taxi       = 0,
              beta_veh_transit    = 0,
              beta_veh_bike       = 0,
              beta_veh_walk       = 0,

              beta_worker_drive   = 0,
              beta_worker_pool    = 0,
              beta_worker_pickup  = 0,
              beta_worker_taxi    = 0,
              beta_worker_transit = 0,
              beta_worker_bike    = 0,
              beta_worker_walk    = 0,
              
              beta_time_mor_eve_drive   = 0,
              beta_time_mor_eve_pool    = 0,
              beta_time_mor_eve_pickup  = 0,
              beta_time_mor_eve_taxi    = 0,
              beta_time_mor_eve_transit = 0,
              beta_time_mor_eve_bike    = 0,
              beta_time_mor_eve_walk    = 0,

              # beta_time_once_drive   = 0,
              # beta_time_once_pool    = 0,
              # beta_time_once_pickup  = 0,
              # beta_time_once_taxi    = 0,
              # beta_time_once_transit = 0,
              # beta_time_once_bike    = 0,
              # beta_time_once_walk    = 0,

              beta_time_weekend_drive   = 0,
              beta_time_weekend_pool    = 0,
              beta_time_weekend_pickup  = 0,
              beta_time_weekend_taxi    = 0,
              beta_time_weekend_transit = 0,
              beta_time_weekend_bike    = 0,
              beta_time_weekend_walk    = 0,
              
              # beta_freq_month_drive   = 0,
              # beta_freq_month_pool    = 0,
              # beta_freq_month_pickup  = 0,
              # beta_freq_month_taxi    = 0,
              # beta_freq_month_transit = 0,
              # beta_freq_month_bike    = 0,
              # beta_freq_month_walk    = 0,
              
              beta_freq_week_drive   = 0,
              beta_freq_week_pool    = 0,
              beta_freq_week_pickup  = 0,
              beta_freq_week_taxi    = 0,
              beta_freq_week_transit = 0,
              beta_freq_week_bike    = 0,
              beta_freq_week_walk    = 0,
              
              beta_freq_24days_drive   = 0,
              beta_freq_24days_pool    = 0,
              beta_freq_24days_pickup  = 0,
              beta_freq_24days_taxi    = 0,
              beta_freq_24days_transit = 0,
              beta_freq_24days_bike    = 0,
              beta_freq_24days_walk    = 0,
              
              beta_freq_57days_drive   = 0,
              beta_freq_57days_pool    = 0,
              beta_freq_57days_pickup  = 0,
              beta_freq_57days_taxi    = 0,
              beta_freq_57days_transit = 0,
              beta_freq_57days_bike    = 0,
              beta_freq_57days_walk    = 0,

              beta_company_drive   = 0,
              beta_company_pool    = 0,
              beta_company_pickup  = 0,
              beta_company_taxi    = 0,
              beta_company_transit = 0,
              beta_company_bike    = 0,
              beta_company_walk    = 0
              )

### Vector with names (in quotes) of parameters to be kept fixed at their starting value in apollo_beta, use apollo_beta_fixed = c() if none
apollo_fixed = c("asc_drive",
                 "beta_female_drive",
                 "beta_age_drive",
                 "beta_inc_30k_75k_drive",
                 "beta_inc_75k_100k_drive",
                 "beta_inc_over100k_drive",
                 "beta_color_drive",
                 "beta_veh_drive",
                 "beta_worker_drive",
                 "beta_time_mor_eve_drive",
                 "beta_time_weekend_drive",
                 "beta_freq_week_drive",
                 "beta_freq_24days_drive",
                 "beta_freq_57days_drive",
                 "beta_company_drive"
                 )

# ################################################################# #
#### GROUP AND VALIDATE INPUTS                                   ####
# ################################################################# #

apollo_inputs = apollo_validateInputs()

# ################################################################# #
#### DEFINE MODEL AND LIKELIHOOD FUNCTION                        ####
# ################################################################# #

apollo_probabilities=function(apollo_beta, apollo_inputs, functionality="estimate"){

  ### Attach inputs and detach after function exit
  apollo_attach(apollo_beta, apollo_inputs)
  on.exit(apollo_detach(apollo_beta, apollo_inputs))

  ### Create list of probabilities P
  P = list()
  
  ### List of utilities: these must use the same names as in mnl_settings, order is irrelevant
  V = list()
  V[["drive"]]   = asc_drive   + beta_female_drive   * female + beta_age_drive   * age + beta_freq_week_drive   * freq_week + beta_freq_24days_drive   * freq_24days + beta_freq_57days_drive   * freq_57days + beta_color_drive*color + beta_veh_drive*veh + beta_worker_drive*worker + beta_company_drive * company + beta_inc_30k_75k_drive*inc_30k_75k + beta_inc_75k_100k_drive*inc_75k_100k + beta_inc_over100k_drive*inc_over100k + beta_time_mor_eve_drive*time_mor_eve + beta_time_weekend_drive*time_weekend 
  V[["pool"]]    = asc_pool    + beta_female_pool    * female + beta_age_pool    * age + beta_freq_week_pool    * freq_week + beta_freq_24days_pool    * freq_24days + beta_freq_57days_pool    * freq_57days + beta_color_pool*color + beta_veh_pool*veh + beta_worker_pool*worker + beta_company_pool * company + beta_inc_30k_75k_pool*inc_30k_75k + beta_inc_75k_100k_pool*inc_75k_100k + beta_inc_over100k_pool*inc_over100k + beta_time_mor_eve_pool*time_mor_eve + beta_time_weekend_pool*time_weekend 
  V[["pickup"]]  = asc_pickup  + beta_female_pickup  * female + beta_age_pickup  * age + beta_freq_week_pickup  * freq_week + beta_freq_24days_pickup  * freq_24days + beta_freq_57days_pickup  * freq_57days + beta_color_pickup*color + beta_veh_pickup*veh + beta_worker_pickup*worker + beta_company_pickup * company + beta_inc_30k_75k_pickup*inc_30k_75k + beta_inc_75k_100k_pickup*inc_75k_100k + beta_inc_over100k_pickup*inc_over100k + beta_time_mor_eve_pickup*time_mor_eve + beta_time_weekend_pickup*time_weekend 
  V[["taxi"]]    = asc_taxi    + beta_female_taxi    * female + beta_age_taxi    * age + beta_freq_week_taxi    * freq_week + beta_freq_24days_taxi    * freq_24days + beta_freq_57days_taxi    * freq_57days + beta_color_taxi*color + beta_veh_taxi*veh + beta_worker_taxi*worker + beta_company_taxi * company + beta_inc_30k_75k_taxi*inc_30k_75k + beta_inc_75k_100k_taxi*inc_75k_100k + beta_inc_over100k_taxi*inc_over100k + beta_time_mor_eve_taxi*time_mor_eve + beta_time_weekend_taxi*time_weekend 
  V[["transit"]] = asc_transit + beta_female_transit * female + beta_age_transit * age + beta_freq_week_transit * freq_week + beta_freq_24days_transit * freq_24days + beta_freq_57days_transit * freq_57days + beta_color_transit*color + beta_veh_transit*veh + beta_worker_transit*worker + beta_company_transit * company + beta_inc_30k_75k_transit*inc_30k_75k + beta_inc_75k_100k_transit*inc_75k_100k + beta_inc_over100k_transit*inc_over100k + beta_time_mor_eve_transit*time_mor_eve + beta_time_weekend_transit*time_weekend 
  V[["bike"]]    = asc_bike    + beta_female_bike    * female + beta_age_bike    * age + beta_freq_week_bike    * freq_week + beta_freq_24days_bike    * freq_24days + beta_freq_57days_bike    * freq_57days + beta_color_bike*color + beta_veh_bike*veh + beta_worker_bike*worker + beta_company_bike * company + beta_inc_30k_75k_bike*inc_30k_75k + beta_inc_75k_100k_bike*inc_75k_100k + beta_inc_over100k_bike*inc_over100k + beta_time_mor_eve_bike*time_mor_eve + beta_time_weekend_bike*time_weekend 
  V[["walk"]]    = asc_walk    + beta_female_walk    * female + beta_age_walk    * age + beta_freq_week_walk    * freq_week + beta_freq_24days_walk    * freq_24days + beta_freq_57days_walk    * freq_57days + beta_color_walk*color + beta_veh_walk*veh + beta_worker_walk*worker + beta_company_walk * company + beta_inc_30k_75k_walk*inc_30k_75k + beta_inc_75k_100k_walk*inc_75k_100k + beta_inc_over100k_walk*inc_over100k + beta_time_mor_eve_walk*time_mor_eve + beta_time_weekend_walk*time_weekend 
  
  ### Define settings for MNL model component
  mnl_settings = list(
    alternatives  = c(drive=0, pool=1, pickup=2, taxi=3, transit=4, bike=5, walk=6), 
    avail         = list(drive=av_drive, pool=av_pool, pickup=av_pickup, taxi=av_taxi, transit=av_transit, bike=av_bike, walk=av_walk), 
    choiceVar     = access,
    utilities     = V
  )
  
  ### Compute probabilities using MNL model
  P[["model"]] = apollo_mnl(mnl_settings, functionality)

  ### Take product across observation for same individual
  # P = apollo_panelProd(P, apollo_inputs, functionality)

  ### Prepare and return outputs of function
  P = apollo_prepareProb(P, apollo_inputs, functionality)
  return(P)
}

# ################################################################# #
#### MODEL ESTIMATION                                            ####
# ################################################################# #

model = apollo_estimate(apollo_beta, apollo_fixed, apollo_probabilities, apollo_inputs)

# ################################################################# #
#### MODEL OUTPUTS                                               ####
# ################################################################# #

# ----------------------------------------------------------------- #
#---- FORMATTED OUTPUT (TO SCREEN)                               ----
# ----------------------------------------------------------------- #

apollo_modelOutput(model)

# ----------------------------------------------------------------- #
#---- FORMATTED OUTPUT (TO FILE, using model name)               ----
# ----------------------------------------------------------------- #

apollo_saveOutput(model)


