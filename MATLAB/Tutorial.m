load('minerva.mat')
minerva.minervaURL = 'http://www.vmh.life/minerva/galaxy.xhtml';
minerva.map = 'ReconMap-2.01';
minerva.login = 'amaury.pelzer';
minerva.password = 'amaury.pelzer4803';
minerva.googleLicenseConsent = 'true';
%% 

initCobraToolbox(false);
%% 

model = readCbModel('Recon2.v04.mat');
%% 
formula = printRxnFormula(model, 'ATPS4m');
model_atp_production = model; % re-name the model to do not modify the original one.

model_atp_production = changeObjective(model_atp_production, 'ATPS4m');
solution_atp_prod_max_regularised = optimizeCbModel(model_atp_production, 'max',1e-6);
solution_atp_prod_max_sparse = optimizeCbModel(model_atp_production, 'max','zero');

nnz(solution_atp_prod_max_regularised.v);
solution_atp_prod_max_regularised.v(strcmp(model.rxns,'r0603'));
nnz(solution_atp_prod_max_sparse.v);
solution_atp_prod_max_sparse.v(strcmp(model.rxns,'r0603'));
%% 

serverResponse = buildFluxDistLayout(minerva, model, solution_atp_prod_max_regularised, 'atp_prod_max_regularised3',[],'#6617B5');
serverResponse = buildFluxDistLayout(minerva, model, solution_atp_prod_max_sparse, 'atp_prod_max_sparse4',[],'#6617B5');

generateSubsytemsLayout(minerva, model, 'Citric acid cycle', '#6617B5');
%% 

load('minerva.mat')
minerva.minervaURL = 'http://www.vmh.life/minerva/galaxy.xhtml';
minerva.map = 'ReconMap-3';
minerva.login = 'amaury.pelzer';
minerva.password = 'amaury.pelzer4803';
minerva.googleLicenseConsent = 'true';

model = readCbModel('Recon3D_301.mat');
