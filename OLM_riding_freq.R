# ################################################################# #
#### LOAD LIBRARY AND DEFINE CORE SETTINGS                       ####
# ################################################################# #

### Clear memory
#rm(list = ls())

### Load Apollo library
library(apollo)

### Initialise code
apollo_initialise()

### Set core controls
apollo_control = list(
  modelName       = "OLM_amtrak_riding_freq",
  modelDescr      = "OLM on Amtrak riding frequency with complete dataset",
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
database$access_drive = ifelse(database$access==1, 1, 0)
database$access_pool  = ifelse(database$access==2, 1, 0)
database$access_bike  = ifelse(database$access==3, 1, 0)
database$access_walk  = ifelse(database$access==4, 1, 0)


# ################################################################# #
#### DEFINE MODEL PARAMETERS                                     ####
# ################################################################# #

### Vector of parameters, including any that are kept fixed in estimation
apollo_beta = c(beta_female       = 0,
                beta_age          = 0,
                beta_inc          = 0,
                beta_color        = 0,
                beta_veh          = 0,
                beta_worker       = 0,
                beta_company      = 0,
                
                # beta_age_18_24      = 0,
                # beta_age_25_34      = 0,
                # beta_age_35_44      = 0,
                # beta_age_45_54      = 0,
                # beta_age_55_64      = 0,
                # beta_age_65         = 0,
                # 
                # beta_inc_under15k   = 0,
                # beta_inc_15k_30k    = 0,
                # beta_inc_30k_50k    = 0,
                # beta_inc_50k_75k    = 0,
                # beta_inc_75k_100k   = 0,
                # beta_inc_100k_150k  = 0,
                # beta_inc_over150k   = 0,
              
                beta_time_mor_eve = 0,
                beta_time_once    = 0,
                beta_time_weekend = 0,
              
                # beta_start        = 0,
                # beta_end          = 0,
              
                beta_access_drive = 0,
                beta_access_pool  = 0,
                beta_access_bike  = 0,
                beta_access_walk  = 0,
              
                tau_freq_1        = 1, 
                tau_freq_2        = 2, 
                tau_freq_3        = 3)

### Vector with names (in quotes) of parameters to be kept fixed at their starting value in apollo_beta, use apollo_beta_fixed = c() if none
apollo_fixed = c("beta_time_mor_eve", "beta_access_drive")

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
  
  ### Calculate probabilities using Ordered Logit model
  ol_settings = list(outcomeOrdered = freq,
                     
                     utility =
                       beta_female*female + 
                       beta_age*age +
                       beta_inc*inc +
                       beta_color*color +
                       beta_veh*veh +
                       beta_worker*worker +
                       beta_company * company +
                       
                       # beta_age_18_24*age_18_24 + 
                       # beta_age_25_34*age_25_34 +
                       # beta_age_35_44*age_35_44 + 
                       # beta_age_45_54*age_45_54 + 
                       # beta_age_55_64*age_55_64 + 
                       # beta_age_65*age_65 + 
                       # 
                       # beta_inc_under15k*inc_under15k + 
                       # beta_inc_15k_30k*inc_15k_30k +
                       # beta_inc_30k_50k*inc_30k_50k + 
                       # beta_inc_50k_75k*inc_50k_75k +
                       # beta_inc_75k_100k*inc_75k_100k +
                       # beta_inc_100k_150k*inc_100k_150k +
                       # beta_inc_over150k*inc_over150k +
                     
                       beta_time_mor_eve * time_mor_eve +
                       beta_time_once    * time_once    +
                       beta_time_weekend * time_weekend +
                       
                       # beta_start * start +
                       # beta_end * end +
                       
                       beta_access_drive * access_drive +
                       beta_access_pool * access_pool +
                       #beta_access_pick * access_pick +
                       #beta_access_taxi * access_taxi +
                       #beta_access_transit * access_transit +
                       beta_access_bike * access_bike +
                       beta_access_walk * access_walk,

                     tau = list(tau_freq_1, tau_freq_2, tau_freq_3))
  
  P[["model"]] = apollo_ol(ol_settings, functionality)
  
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

# apollo_saveOutput(model)

