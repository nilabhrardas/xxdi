### Getting started with xxdi
'xxdi' is an R package for evaluating the research expertise of an institution in different thematic fields of research. In this tutorial, we will walk through the usage of the different functions to calculate the various expertise indices. 

The latest stable version of the package is available on [CRAN](https://cran.r-project.org/web/packages/xxdi/index.html), while the latest in-development version is available on [GitHub](https://github.com/nilabhrardas/xxdi). These versions can be installed using the following commands:

- From CRAN (recommended):

```
install.packages("xxdi")
```

- From GitHub:
```
# install the 'remotes' package if unavailable
ifelse(requireNamespace("remotes", quietly = TRUE), TRUE, install.packages("remotes"))

# install 'xxdi' from the github repo
remotes::install_github("nilabhrardas/xxdi")
```

### Loading the included example data
We have included an example dataset along with the package to allow users to easily familiarise themselves with the different functionalities of the package. The data can be loaded into the R working environment using the 'data()' command:

```
# load the xxdi package if not already loaded
library(xxdi)

# load example data
data(WoSdata)
```

'WoSdata' is a list of publications, published between 2011 and 2020, of a research institution in India, queried from the [Web of Science](https://clarivate.com/academia-government/scientific-and-academic-research/research-discovery-and-referencing/web-of-science/) (WoS) database. Further details on the data can be accessed using the help command:

```
?WoSdata
```

Now that the example data has been loaded into the environment, we can explore its contents. We will use the 'head()' command to print the first few rows of the data frame:

```
head(WoSdata)
```

Output:
```
# # A tibble: 6 × 5
# UT.Unique.WOS.ID    Keywords.Plus                WoS.Categories Times.Cited.WoS.Core inst_count
# <chr>               <chr>                        <chr>                         <dbl>      <dbl>
# 1 WOS:000560355300001 ENCRYPTION; SEARCH           Computer Scie…                    3       3.59
# 2 WOS:000537414100011 16S RIBOSOMAL-RNA; POSTOPER… Microbiology                      3       8.09
# 3 WOS:000508646000003 BLOOD-PRESSURE VARIABILITY;… Pharmacology …                    3       4.68
# 4 WOS:000509674900007 NA                           Multidiscipli…                    3       8.95
# 5 WOS:000492345900041 C-ELEGANS; MOLECULAR DOCKIN… Medicine, Res…                    3       9.46
# 6 WOS:000485861500012 CARBON NANOTUBES; CONDUCTIN… Multidiscipli…                    3       1.41
```

In the above output, each row represents a distinct publication entry. Each publication is given a unique identifier, recorded in the 'UT.Unique.WOS.ID' column. 'Keywords.Plus' corresponds to the indexed keywords corresponding to the publication, 'WoS.Categories' corresponds to the indexed categories for the publication, and 'Times.Cited.WoS.Core' corresponds to the total number of citations received from publications indexed in the WoS database. These metadata are generally included for any dataset queried from the such databases. 

*Note: Missings values (*NA*s) are addressed internally within each function, so we can ignore those for now.*

### Calculate expertise indices
Now, we will use this example data to calculate the expertise indices and their vairants for this scholarly institution. The expertise index functions illstrated below output a list of two vectors: one that gives the magnitude of the index (say 'x'), and another that gives the list of the top 'x' thematic areas. For example, the 'x_index()' function, used to calculate the x-index, returns a '$x.index' which is the magnitude or value of the x-index and a '$x.ketwords' which is the list of the top cited keywords that reach the x-index threshold.

#### $x$-index
The $x$-index is a measure of thematic area expertise depth and is computed using the indexed keywords. To compute the $x$-index, we use the 'x_index()' function:

```
x_index(df = WoSdata,
        id = "UT.Unique.WOS.ID",
        kw = "Keywords.Plus",
        cit = "Times.Cited.WoS.Core",
        plot = FALSE)
```

Output:
```
# $x.index
# [1] 254
# 
# $x.keywords
# [1] "NANOPARTICLES"                    "IN-VITRO"                        
# [3] "BIOSYNTHESIS"                     "GREEN SYNTHESIS"                 
# [5] "SILVER NANOPARTICLES"             "GROWTH"                          
# [7] "PERFORMANCE"                      "LEAF EXTRACT"                    
# [9] "FABRICATION"                      "EXPRESSION"                      
# [11] "IDENTIFICATION"                   "INHIBITION"                      
# [13] "ANTIBACTERIAL ACTIVITY"           "PHOTOLUMINESCENCE"               
# [15] "RESISTANCE"                       "ANTIBACTERIAL"                   
# [17] "ACID"                             "COMPOSITE"                       
# [19] "GOLD NANOPARTICLES"               "ANTIOXIDANT"                     
# [21] "OPTICAL-PROPERTIES"               "PSEUDOMONAS-AERUGINOSA"          
# [23] "BIOFILM FORMATION"                "ZINC-OXIDE NANOPARTICLES"        
# [25] "BEHAVIOR"                         "FILMS"                           
# [27] "EXTRACT"                          "NANORODS"                        
# [29] "MECHANISM"                        "BACTERIA"                        
# [31] "OXIDATIVE STRESS"                 "APOPTOSIS"                       
# [33] "INFECTIONS"                       "SPECTROSCOPY"                    
# [35] "TEMPERATURE"                      "ZNO NANOPARTICLES"               
# [37] "OXIDE"                            "THIN-FILMS"                      
# [39] "FILM"                             "MODEL"                           
# [41] "DEPOSITION"                       "ESCHERICHIA-COLI"                
# [43] "ZINC-OXIDE"                       "STABILITY"                       
# [45] "FACILE SYNTHESIS"                 "TOXICITY"                        
# [47] "CYTOTOXICITY"                     "GOLD"                            
# [49] "VIRULENCE"                        "NANOSTRUCTURES"                  
# [51] "SENSOR"                           "NF-KAPPA-B"                      
# [53] "PARTICLES"                        "CELLS"                           
# [55] "NANOCOMPOSITES"                   "OXIDATION"                       
# [57] "ANTIMICROBIAL ACTIVITY"           "INDUCED OXIDATIVE STRESS"        
# [59] "ANTIBIOFILM"                      "SYSTEMS"                         
# [61] "WATER"                            "CANCER"                          
# [63] "CO"                               "SYSTEM"                          
# [65] "ELECTRODES"                       "PROTEIN"                         
# [67] "COMPOSITES"                       "QUANTUM DOTS"                    
# [69] "MAGNETIC-PROPERTIES"              "RECOGNITION"                     
# [71] "NANOCOMPOSITE"                    "ROUTE"                           
# [73] "DERIVATIVES"                      "DEGRADATION"                     
# [75] "BINDING"                          "DOCKING"                         
# [77] "SILVER"                           "CARBON"                          
# [79] "FORCE-FIELD"                      "GLASSY-CARBON ELECTRODE"         
# [81] "GENE-EXPRESSION"                  "SURFACE"                         
# [83] "CRYSTAL-STRUCTURE"                "ACTIVATION"                      
# [85] "BIOSENSOR"                        "SIZE"                            
# [87] "ELECTRODE"                        "INHIBITORS"                      
# [89] "SOLVOTHERMAL SYNTHESIS"           "NANOSHEETS"                      
# [91] "DESIGN"                           "MORPHOLOGY"                      
# [93] "STAPHYLOCOCCUS-AUREUS"            "NANOTUBES"                       
# [95] "INFECTION"                        "ACTINOMYCETE"                    
# [97] "ADSORPTION"                       "MN"                              
# [99] "SEMICONDUCTORS"                   "MECHANISMS"                      
# [101] "CHITOSAN"                         "HYDROTHERMAL SYNTHESIS"          
# [103] "IONIC-CONDUCTIVITY"               "MEDIATED SYNTHESIS"              
# [105] "PROTEINS"                         "EFFICACY"                        
# [107] "ELECTRICAL-PROPERTIES"            "INNATE IMMUNITY"                 
# [109] "LUNG-CANCER"                      "PLANT"                           
# [111] "SENSING PROPERTIES"               "LUMINESCENCE"                    
# [113] "PURIFICATION"                     "ANTIBIOTIC-RESISTANCE"           
# [115] "ELECTROCHEMICAL PROPERTIES"       "MICROSTRUCTURE"                  
# [117] "REDUCTION"                        "CULEX-QUINQUEFASCIATUS"          
# [119] "ASCORBIC-ACID"                    "CARBON NANOTUBES"                
# [121] "AQUEOUS EXTRACT"                  "NANOCRYSTALS"                    
# [123] "POLYANILINE"                      "GRAPHENE OXIDE"                  
# [125] "ANTIBIOFILM ACTIVITY"             "IN-VIVO"                         
# [127] "AQUEOUS-SOLUTION"                 "ESTROGEN-RECEPTOR-BETA"          
# [129] "STRUCTURAL-CHARACTERIZATION"      "DOPAMINE"                        
# [131] "ELECTROCHEMICAL PERFORMANCE"      "OIL"                             
# [133] "ZNO"                              "ACCURATE DOCKING"                
# [135] "ABSORPTION"                       "ALZHEIMERS-DISEASE"              
# [137] "RAINBOW-TROUT"                    "GRAPHENE"                        
# [139] "ORIENTATION"                      "EPIDERMAL-GROWTH-FACTOR"         
# [141] "CONSTANTS"                        "NANOFIBERS"                      
# [143] "OXIDE NANOPARTICLES"              "SYNCHRONIZATION"                 
# [145] "ARRAYS"                           "POLYMERIZATION"                  
# [147] "PREDICTION"                       "CAENORHABDITIS-ELEGANS"          
# [149] "NANOWIRES"                        "CALCINED MATERIALS"              
# [151] "DISCRETE"                         "SUSCEPTIBILITY"                  
# [153] "FACTOR-KAPPA-B"                   "EXTRACTS"                        
# [155] "COMPLEXES"                        "AEDES-AEGYPTI"                   
# [157] "VETERINARY IMPORTANCE"            "CELL-CYCLE ARREST"               
# [159] "TIO2"                             "SYNTHESIZED SILVER NANOPARTICLES"
# [161] "PHOTOCATALYTIC ACTIVITY"          "EFFICIENT"                       
# [163] "MOTILITY"                         "THICKNESS"                       
# [165] "STRAINS"                          "ROOM-TEMPERATURE FERROMAGNETISM" 
# [167] "ELECTRONIC BEHAVIOR"              "REMOVAL"                         
# [169] "DRUG DISCOVERY"                   "METAL NANOPARTICLES"             
# [171] "NITRIC-OXIDE SYNTHASE"            "FISH"                            
# [173] "REDUCED GRAPHENE OXIDE"           "DISCOVERY"                       
# [175] "EXTRACTION"                       "IONIC LIQUID"                    
# [177] "SUPERCAPACITOR"                   "GLOBAL EXPONENTIAL STABILITY"    
# [179] "GENERATION"                       "NATURAL-PRODUCTS"                
# [181] "BREAST-CANCER"                    "TRANSPORT"                       
# [183] "VOLTAMMETRIC DETERMINATION"       "BETA-CYCLODEXTRIN"               
# [185] "TITANIUM-DIOXIDE"                 "DELIVERY"                        
# [187] "DYNAMICS"                         "CONDUCTIVITY"                    
# [189] "CRITERIA"                         "LEAVES"                          
# [191] "ESSENTIAL OIL"                    "GENES"                           
# [193] "TEXTILES"                         "VIRULENCE FACTORS"               
# [195] "L."                               "PHENOLIC-COMPOUNDS"              
# [197] "CATALYTIC-ACTIVITY"               "AG"                              
# [199] "DISEASE RESISTANCE"               "GENE"                            
# [201] "GASTRIC-CANCER"                   "MOLECULAR DOCKING"               
# [203] "SHEETS"                           "ELECTRODEPOSITION"               
# [205] "COLORECTAL-CANCER"                "EPITHELIAL-CELLS"                
# [207] "OPTIMIZATION"                     "PLANTS"                          
# [209] "THERAPY"                          "NITRATE"                         
# [211] "SUSPENSIONS"                      "GLUTATHIONE"                     
# [213] "ESSENTIAL OILS"                   "RAMAN"                           
# [215] "SPRAY-PYROLYSIS"                  "SOL-GEL"                         
# [217] "SOY ISOFLAVONE"                   "BIOLOGICAL SYNTHESIS"            
# [219] "EXPONENTIAL STABILITY"            "PROSTATE-CANCER"                 
# [221] "DYE"                              "CHEMISTRY"                       
# [223] "ANTIHEMOLYTIC ACTIVITIES"         "RELEASE"                         
# [225] "MECHANICAL-PROPERTIES"            "VARYING DELAYS"                  
# [227] "ELECTRIC PROPERTIES"              "HARVEYI"                         
# [229] "HIGH-TEMPERATURE FERROMAGNETISM"  "SECONDARY METABOLITES"           
# [231] "URIC-ACID"                        "ANTICANCER ACTIVITY"             
# [233] "MICROSPHERES"                     "POLYPYRROLE"                     
# [235] "ELECTROCATALYTIC REDUCTION"       "ANTIBIOTICS"                     
# [237] "ACTIVATED PROTEIN-KINASE"         "ELECTROCHROMIC PROPERTIES"       
# [239] "KINETICS"                         "BIOSENSORS"                      
# [241] "CURCUMIN"                         "LIPID-PEROXIDATION"              
# [243] "MEDICINAL-PLANTS"                 "NITROGEN"                        
# [245] "WALLED CARBON NANOTUBES"          "DRUG-DELIVERY"                   
# [247] "ENERGY-STORAGE"                   "LI-STORAGE"                      
# [249] "ROBUST STABILITY"                 "ANTICANCER"                      
# [251] "GEL"                              "HUMAN HEPATOCELLULAR-CARCINOMA"  
# [253] "PH"                               "POWDERS"                         
```

Although, we have applied the x-index to an institution, it is best utilised in th context of discipline-specific departments/schools within institutions or discipline-specific research bodies, where the $x$-index evaluates the depth of research expertise.

#### $x_c$-index
The $x_c$-index is the category adjusted $x$-index, acounting for bias due to multidisciplinary keywords, i.e., bias due to the same keyword being nested within multiple unrelated categories. To compute the $x_c$-index, we use the 'xc_index()' function:

```
xc_index(df = WoSdata,
         id = "UT.Unique.WOS.ID",
         kw = "Keywords.Plus",
         cat = "WoS.Categories",
         cit = "Times.Cited.WoS.Core",
         plot = FALSE)
```

Output:
```
# $xc.index
# [1] 251
# 
# $xc.keywords
# [1] "NANOPARTICLES (Materials Science, Multidisciplinary)"                  
# [2] "GREEN SYNTHESIS (Biochemistry & Molecular Biology)"                    
# [3] "PERFORMANCE (Physics, Condensed Matter)"                               
# [4] "PERFORMANCE (Materials Science, Multidisciplinary)"                    
# [5] "SILVER NANOPARTICLES (Biophysics)"                                     
# [6] "SILVER NANOPARTICLES (Biochemistry & Molecular Biology)"               
# [7] "GREEN SYNTHESIS (Biophysics)"                                          
# [8] "NANOPARTICLES (Chemistry, Physical)"                                   
# [9] "PERFORMANCE (Chemistry, Physical)"                                     
# [10] "BIOSYNTHESIS (Biochemistry & Molecular Biology)"                       
# [11] "NANOPARTICLES (Physics, Applied)"                                      
# [12] "PERFORMANCE (Physics, Applied)"                                        
# [13] "NANORODS (Materials Science, Multidisciplinary)"                       
# [14] "PHOTOLUMINESCENCE (Materials Science, Multidisciplinary)"              
# [15] "GROWTH (Materials Science, Multidisciplinary)"                         
# [16] "IN-VITRO (Biochemistry & Molecular Biology)"                           
# [17] "OPTICAL-PROPERTIES (Materials Science, Multidisciplinary)"             
# [18] "PERFORMANCE (Electrochemistry)"                                        
# [19] "NANOPARTICLES (Physics, Condensed Matter)"                             
# [20] "COMPOSITE (Chemistry, Physical)"                                       
# [21] "NANOPARTICLES (Electrochemistry)"                                      
# [22] "ANTIBACTERIAL ACTIVITY (Biochemistry & Molecular Biology)"             
# [23] "IN-VITRO (Microbiology)"                                               
# [24] "IN-VITRO (Biotechnology & Applied Microbiology)"                       
# [25] "GROWTH (Physics, Applied)"                                             
# [26] "FABRICATION (Electrochemistry)"                                        
# [27] "OPTICAL-PROPERTIES (Physics, Condensed Matter)"                        
# [28] "QUANTUM DOTS (Materials Science, Multidisciplinary)"                   
# [29] "BIOSYNTHESIS (Biophysics)"                                             
# [30] "THIN-FILMS (Materials Science, Multidisciplinary)"                     
# [31] "OPTICAL-PROPERTIES (Physics, Applied)"                                 
# [32] "FABRICATION (Materials Science, Multidisciplinary)"                    
# [33] "SENSOR (Chemistry, Analytical)"                                        
# [34] "NANOPARTICLES (Chemistry, Analytical)"                                 
# [35] "QUANTUM DOTS (Chemistry, Physical)"                                    
# [36] "CO (Materials Science, Multidisciplinary)"                             
# [37] "EXPRESSION (Biotechnology & Applied Microbiology)"                     
# [38] "SENSOR (Electrochemistry)"                                             
# [39] "COMPOSITE (Materials Science, Multidisciplinary)"                      
# [40] "ZINC-OXIDE NANOPARTICLES (Biochemistry & Molecular Biology)"           
# [41] "NANOPARTICLES (Nanoscience & Nanotechnology)"                          
# [42] "GROWTH (Physics, Condensed Matter)"                                    
# [43] "NANORODS (Chemistry, Physical)"                                        
# [44] "PHOTOLUMINESCENCE (Physics, Applied)"                                  
# [45] "BIOSYNTHESIS (Engineering, Chemical)"                                  
# [46] "TEMPERATURE (Physics, Applied)"                                        
# [47] "GREEN SYNTHESIS (Materials Science, Multidisciplinary)"                
# [48] "ANTIBACTERIAL ACTIVITY (Biophysics)"                                   
# [49] "FACILE SYNTHESIS (Materials Science, Multidisciplinary)"               
# [50] "LEAF EXTRACT (Engineering, Chemical)"                                  
# [51] "SPECTROSCOPY (Materials Science, Multidisciplinary)"                   
# [52] "CO (Chemistry, Physical)"                                              
# [53] "NF-KAPPA-B (Pharmacology & Pharmacy)"                                  
# [54] "FABRICATION (Chemistry, Analytical)"                                   
# [55] "RESISTANCE (Biotechnology & Applied Microbiology)"                     
# [56] "PSEUDOMONAS-AERUGINOSA (Microbiology)"                                 
# [57] "PHOTOLUMINESCENCE (Physics, Condensed Matter)"                         
# [58] "BIOSYNTHESIS (Physics, Applied)"                                       
# [59] "GOLD NANOPARTICLES (Biophysics)"                                       
# [60] "WATER (Chemistry, Physical)"                                           
# [61] "APOPTOSIS (Biochemistry & Molecular Biology)"                          
# [62] "LEAF EXTRACT (Biochemistry & Molecular Biology)"                       
# [63] "THIN-FILMS (Physics, Applied)"                                         
# [64] "PSEUDOMONAS-AERUGINOSA (Biotechnology & Applied Microbiology)"         
# [65] "SILVER NANOPARTICLES (Materials Science, Multidisciplinary)"           
# [66] "BIOSYNTHESIS (Materials Science, Multidisciplinary)"                   
# [67] "ACID (Biophysics)"                                                     
# [68] "ZINC-OXIDE (Materials Science, Multidisciplinary)"                     
# [69] "OXIDE (Materials Science, Multidisciplinary)"                          
# [70] "GROWTH (Chemistry, Physical)"                                          
# [71] "PHOTOLUMINESCENCE (Chemistry, Physical)"                               
# [72] "RESISTANCE (Microbiology)"                                             
# [73] "FORCE-FIELD (Biochemistry & Molecular Biology)"                        
# [74] "OXIDATION (Chemistry, Physical)"                                       
# [75] "EPIDERMAL-GROWTH-FACTOR (Nutrition & Dietetics)"                       
# [76] "ESTROGEN-RECEPTOR-BETA (Nutrition & Dietetics)"                        
# [77] "FACTOR-KAPPA-B (Nutrition & Dietetics)"                                
# [78] "LUNG-CANCER (Nutrition & Dietetics)"                                   
# [79] "GOLD NANOPARTICLES (Biochemistry & Molecular Biology)"                 
# [80] "NANOPARTICLES (Chemistry, Multidisciplinary)"                          
# [81] "ANTIOXIDANT (Biochemistry & Molecular Biology)"                        
# [82] "BIOFILM FORMATION (Microbiology)"                                      
# [83] "IN-VITRO (Pharmacology & Pharmacy)"                                    
# [84] "BIOSYNTHESIS (Microbiology)"                                           
# [85] "FILM (Engineering, Chemical)"                                          
# [86] "IDENTIFICATION (Medicine, Research & Experimental)"                    
# [87] "MECHANISM (Materials Science, Biomaterials)"                           
# [88] "BIOSYNTHESIS (Immunology)"                                             
# [89] "OPTICAL-PROPERTIES (Chemistry, Physical)"                              
# [90] "FABRICATION (Physics, Applied)"                                        
# [91] "IN-VITRO (Marine & Freshwater Biology)"                                
# [92] "RAINBOW-TROUT (Fisheries)"                                             
# [93] "INNATE IMMUNITY (Immunology)"                                          
# [94] "SILVER NANOPARTICLES (Physics, Applied)"                               
# [95] "EXTRACT (Biochemistry & Molecular Biology)"                            
# [96] "ZINC-OXIDE NANOPARTICLES (Biophysics)"                                 
# [97] "SPECTROSCOPY (Nanoscience & Nanotechnology)"                           
# [98] "MN (Chemistry, Physical)"                                              
# [99] "SEMICONDUCTORS (Chemistry, Physical)"                                  
# [100] "MN (Materials Science, Multidisciplinary)"                             
# [101] "INNATE IMMUNITY (Marine & Freshwater Biology)"                         
# [102] "ANTIBACTERIAL (Biochemistry & Molecular Biology)"                      
# [103] "LEAF EXTRACT (Biophysics)"                                             
# [104] "INNATE IMMUNITY (Fisheries)"                                           
# [105] "INNATE IMMUNITY (Veterinary Sciences)"                                 
# [106] "ZINC-OXIDE (Materials Science, Biomaterials)"                          
# [107] "BIOSENSOR (Chemistry, Analytical)"                                     
# [108] "NANORODS (Nanoscience & Nanotechnology)"                               
# [109] "GREEN SYNTHESIS (Engineering, Chemical)"                               
# [110] "TEMPERATURE (Materials Science, Multidisciplinary)"                    
# [111] "INHIBITION (Biotechnology & Applied Microbiology)"                     
# [112] "INDUCED OXIDATIVE STRESS (Pharmacology & Pharmacy)"                    
# [113] "OXIDATIVE STRESS (Pharmacology & Pharmacy)"                            
# [114] "BEHAVIOR (Materials Science, Multidisciplinary)"                       
# [115] "EXPRESSION (Microbiology)"                                             
# [116] "THIN-FILMS (Chemistry, Physical)"                                      
# [117] "SILVER NANOPARTICLES (Engineering, Chemical)"                          
# [118] "PHOTOLUMINESCENCE (Nanoscience & Nanotechnology)"                      
# [119] "ASCORBIC-ACID (Electrochemistry)"                                      
# [120] "COMPOSITE (Physics, Applied)"                                          
# [121] "ANTIBACTERIAL (Engineering, Chemical)"                                 
# [122] "SPECTROSCOPY (Chemistry, Physical)"                                    
# [123] "BIOSYNTHESIS (Biotechnology & Applied Microbiology)"                   
# [124] "QUANTUM DOTS (Nanoscience & Nanotechnology)"                           
# [125] "FILM (Engineering, Environmental)"                                     
# [126] "IONIC LIQUID (Engineering, Chemical)"                                  
# [127] "IONIC LIQUID (Engineering, Environmental)"                             
# [128] "APOPTOSIS (Chemistry, Applied)"                                        
# [129] "NANOPARTICLES (Biochemistry & Molecular Biology)"                      
# [130] "FILMS (Materials Science, Multidisciplinary)"                          
# [131] "DEPOSITION (Physics, Applied)"                                         
# [132] "OXIDE (Electrochemistry)"                                              
# [133] "BEHAVIOR (Physics, Condensed Matter)"                                  
# [134] "GROWTH (Biotechnology & Applied Microbiology)"                         
# [135] "IN-VITRO (Food Science & Technology)"                                  
# [136] "FABRICATION (Physics, Condensed Matter)"                               
# [137] "INHIBITION (Microbiology)"                                             
# [138] "BEHAVIOR (Chemistry, Physical)"                                        
# [139] "BIOSENSOR (Electrochemistry)"                                          
# [140] "ANTIBACTERIAL ACTIVITY (Pharmacology & Pharmacy)"                      
# [141] "GREEN SYNTHESIS (Immunology)"                                          
# [142] "PARTICLES (Materials Science, Multidisciplinary)"                      
# [143] "GREEN SYNTHESIS (Microbiology)"                                        
# [144] "IN-VITRO (Immunology)"                                                 
# [145] "FILMS (Electrochemistry)"                                              
# [146] "ZINC-OXIDE NANOPARTICLES (Engineering, Chemical)"                      
# [147] "COMPOSITE (Physics, Condensed Matter)"                                 
# [148] "SEMICONDUCTORS (Materials Science, Multidisciplinary)"                 
# [149] "CO (Nanoscience & Nanotechnology)"                                     
# [150] "SILVER NANOPARTICLES (Nanoscience & Nanotechnology)"                   
# [151] "DOCKING (Biochemistry & Molecular Biology)"                            
# [152] "ELECTRONIC BEHAVIOR (Materials Science, Multidisciplinary)"            
# [153] "FILM (Chemistry, Analytical)"                                          
# [154] "INFECTIONS (Microbiology)"                                             
# [155] "MORPHOLOGY (Materials Science, Multidisciplinary)"                     
# [156] "COMPOSITE (Engineering, Chemical)"                                     
# [157] "OPTICAL-PROPERTIES (Engineering, Electrical & Electronic)"             
# [158] "ANTIBACTERIAL ACTIVITY (Immunology)"                                   
# [159] "SENSING PROPERTIES (Chemistry, Physical)"                              
# [160] "DISEASE RESISTANCE (Immunology)"                                       
# [161] "ACID (Chemistry, Analytical)"                                          
# [162] "ANTIBACTERIAL (Physics, Applied)"                                      
# [163] "INHIBITION (Pharmacology & Pharmacy)"                                  
# [164] "CARBON (Materials Science, Multidisciplinary)"                         
# [165] "IN-VITRO (Multidisciplinary Sciences)"                                 
# [166] "APOPTOSIS (Biotechnology & Applied Microbiology)"                      
# [167] "PERFORMANCE (Energy & Fuels)"                                          
# [168] "TEMPERATURE (Chemistry, Physical)"                                     
# [169] "DISEASE RESISTANCE (Fisheries)"                                        
# [170] "BIOFILM FORMATION (Biochemistry & Molecular Biology)"                  
# [171] "IDENTIFICATION (Microbiology)"                                         
# [172] "ZINC-OXIDE (Chemistry, Physical)"                                      
# [173] "DISEASE RESISTANCE (Marine & Freshwater Biology)"                      
# [174] "DISEASE RESISTANCE (Veterinary Sciences)"                              
# [175] "GROWTH (Biochemistry & Molecular Biology)"                             
# [176] "VIRULENCE FACTORS (Microbiology)"                                      
# [177] "FILM (Chemistry, Physical)"                                            
# [178] "ANTIOXIDANT (Pharmacology & Pharmacy)"                                 
# [179] "ZINC-OXIDE (Nanoscience & Nanotechnology)"                             
# [180] "CALCINED MATERIALS (Materials Science, Multidisciplinary)"             
# [181] "ANTIOXIDANT (Engineering, Chemical)"                                   
# [182] "ELECTRICAL-PROPERTIES (Physics, Condensed Matter)"                     
# [183] "IDENTIFICATION (Biotechnology & Applied Microbiology)"                 
# [184] "TEMPERATURE (Physics, Condensed Matter)"                               
# [185] "ELECTRIC PROPERTIES (Chemistry, Physical)"                             
# [186] "ELECTRIC PROPERTIES (Materials Science, Multidisciplinary)"            
# [187] "ELECTRIC PROPERTIES (Nanoscience & Nanotechnology)"                    
# [188] "HIGH-TEMPERATURE FERROMAGNETISM (Chemistry, Physical)"                 
# [189] "HIGH-TEMPERATURE FERROMAGNETISM (Materials Science, Multidisciplinary)"
# [190] "HIGH-TEMPERATURE FERROMAGNETISM (Nanoscience & Nanotechnology)"        
# [191] "MN (Nanoscience & Nanotechnology)"                                     
# [192] "PROTEIN (Biochemistry & Molecular Biology)"                            
# [193] "SEMICONDUCTORS (Nanoscience & Nanotechnology)"                         
# [194] "ACID (Biotechnology & Applied Microbiology)"                           
# [195] "GLASSY-CARBON ELECTRODE (Chemistry, Physical)"                         
# [196] "NANOPARTICLES (Polymer Science)"                                       
# [197] "THIN-FILMS (Physics, Condensed Matter)"                                
# [198] "SILVER NANOPARTICLES (Materials Science, Biomaterials)"                
# [199] "DEPOSITION (Materials Science, Multidisciplinary)"                     
# [200] "EXPRESSION (Medicine, Research & Experimental)"                        
# [201] "MECHANISM (Biochemistry & Molecular Biology)"                          
# [202] "NANOPARTICLES (Biophysics)"                                            
# [203] "ANTIBACTERIAL (Microbiology)"                                          
# [204] "CELLS (Biochemistry & Molecular Biology)"                              
# [205] "FACILE SYNTHESIS (Chemistry, Physical)"                                
# [206] "INFECTIONS (Food Science & Technology)"                                
# [207] "BINDING (Biochemistry & Molecular Biology)"                            
# [208] "ESCHERICHIA-COLI (Microbiology)"                                       
# [209] "NANOSTRUCTURES (Electrochemistry)"                                     
# [210] "BIOFILM FORMATION (Immunology)"                                        
# [211] "DOPAMINE (Chemistry, Analytical)"                                      
# [212] "FILMS (Physics, Applied)"                                              
# [213] "ASCORBIC-ACID (Chemistry, Analytical)"                                 
# [214] "IDENTIFICATION (Biochemistry & Molecular Biology)"                     
# [215] "GENERATION (Multidisciplinary Sciences)"                               
# [216] "ZNO NANOPARTICLES (Biochemistry & Molecular Biology)"                  
# [217] "NANOPARTICLES (Engineering, Electrical & Electronic)"                  
# [218] "SILVER NANOPARTICLES (Chemistry, Physical)"                            
# [219] "VIRULENCE (Food Science & Technology)"                                 
# [220] "CARBON (Chemistry, Physical)"                                          
# [221] "OXIDATIVE STRESS (Biochemistry & Molecular Biology)"                   
# [222] "BIOSYNTHESIS (Spectroscopy)"                                           
# [223] "IN-VITRO (Medicine, Research & Experimental)"                          
# [224] "BIOFILM FORMATION (Medicine, Research & Experimental)"                 
# [225] "RAINBOW-TROUT (Immunology)"                                            
# [226] "BIOSENSORS (Electrochemistry)"                                         
# [227] "ESCHERICHIA-COLI (Immunology)"                                         
# [228] "LI-STORAGE (Chemistry, Physical)"                                      
# [229] "WATER (Engineering, Chemical)"                                         
# [230] "WATER (Engineering, Environmental)"                                    
# [231] "CELL-CYCLE ARREST (Nutrition & Dietetics)"                             
# [232] "COLORECTAL-CANCER (Nutrition & Dietetics)"                             
# [233] "GASTRIC-CANCER (Nutrition & Dietetics)"                                
# [234] "GROWTH (Engineering, Chemical)"                                        
# [235] "HUMAN HEPATOCELLULAR-CARCINOMA (Nutrition & Dietetics)"                
# [236] "PROSTATE-CANCER (Nutrition & Dietetics)"                               
# [237] "SOY ISOFLAVONE (Nutrition & Dietetics)"                                
# [238] "FISH (Fisheries)"                                                      
# [239] "RECOGNITION (Biochemistry & Molecular Biology)"                        
# [240] "CULEX-QUINQUEFASCIATUS (Biochemistry & Molecular Biology)"             
# [241] "DOCKING (Biophysics)"                                                  
# [242] "NANOPARTICLES (Engineering, Chemical)"                                 
# [243] "COMPOSITE (Engineering, Environmental)"                                
# [244] "ELECTROCATALYTIC REDUCTION (Chemistry, Physical)"                      
# [245] "ELECTROCATALYTIC REDUCTION (Engineering, Chemical)"                    
# [246] "ELECTROCATALYTIC REDUCTION (Engineering, Environmental)"               
# [247] "GLASSY-CARBON ELECTRODE (Engineering, Chemical)"                       
# [248] "GLASSY-CARBON ELECTRODE (Engineering, Environmental)"                  
# [249] "IONIC LIQUID (Chemistry, Physical)"                                    
# [250] "LI-STORAGE (Engineering, Chemical)"                                    
# [251] "LI-STORAGE (Engineering, Environmental)"        
```

#### $x_d$-index
The $x_d$-index is a measure of the expertise diversity and is computed using the indexed categories. To compute the $x_d$-index, we use the 'xd_index()' function, and set the 'variant' parameter to "full" (default):

```
xd_index(df = WoSdata,
         id = "UT.Unique.WOS.ID",
         cat = "WoS.Categories",
         cit = "Times.Cited.WoS.Core",
         plot = FALSE)
```

Output:
```
# $xd.index
# [1] 80
# 
# $xd.categories
# [1] "Materials Science, Multidisciplinary"            
# [2] "Biochemistry & Molecular Biology"                
# [3] "Chemistry, Physical"                             
# [4] "Physics, Applied"                                
# [5] "Physics, Condensed Matter"                       
# [6] "Biophysics"                                      
# [7] "Biotechnology & Applied Microbiology"            
# [8] "Electrochemistry"                                
# [9] "Microbiology"                                    
# [10] "Chemistry, Multidisciplinary"                    
# [11] "Pharmacology & Pharmacy"                         
# [12] "Chemistry, Analytical"                           
# [13] "Engineering, Chemical"                           
# [14] "Nanoscience & Nanotechnology"                    
# [15] "Engineering, Electrical & Electronic"            
# [16] "Polymer Science"                                 
# [17] "Immunology"                                      
# [18] "Chemistry, Applied"                              
# [19] "Materials Science, Biomaterials"                 
# [20] "Marine & Freshwater Biology"                     
# [21] "Materials Science, Coatings & Films"             
# [22] "Food Science & Technology"                       
# [23] "Energy & Fuels"                                  
# [24] "Metallurgy & Metallurgical Engineering"          
# [25] "Multidisciplinary Sciences"                      
# [26] "Medicine, Research & Experimental"               
# [27] "Chemistry, Medicinal"                            
# [28] "Spectroscopy"                                    
# [29] "Environmental Sciences"                          
# [30] "Materials Science, Ceramics"                     
# [31] "Plant Sciences"                                  
# [32] "Instruments & Instrumentation"                   
# [33] "Fisheries"                                       
# [34] "Nutrition & Dietetics"                           
# [35] "Computer Science, Artificial Intelligence"       
# [36] "Veterinary Sciences"                             
# [37] "Engineering, Environmental"                      
# [38] "Chemistry, Inorganic & Nuclear"                  
# [39] "Agricultural Engineering"                        
# [40] "Toxicology"                                      
# [41] "Cell Biology"                                    
# [42] "Oncology"                                        
# [43] "Computer Science, Interdisciplinary Applications"
# [44] "Agronomy"                                        
# [45] "Optics"                                          
# [46] "Automation & Control Systems"                    
# [47] "Mathematics, Applied"                            
# [48] "Chemistry, Organic"                              
# [49] "Biology"                                         
# [50] "Computer Science, Information Systems"           
# [51] "Engineering, Multidisciplinary"                  
# [52] "Parasitology"                                    
# [53] "Biochemical Research Methods"                    
# [54] "Mathematics, Interdisciplinary Applications"     
# [55] "Genetics & Heredity"                             
# [56] "Telecommunications"                              
# [57] "Infectious Diseases"                             
# [58] "Crystallography"                                 
# [59] "Physics, Atomic, Molecular & Chemical"           
# [60] "Mathematics"                                     
# [61] "Public, Environmental & Occupational Health"     
# [62] "Mathematical & Computational Biology"            
# [63] "Medical Laboratory Technology"                   
# [64] "Computer Science, Software Engineering"          
# [65] "Tropical Medicine"                               
# [66] "Neurosciences"                                   
# [67] "Water Resources"                                 
# [68] "Computer Science, Theory & Methods"              
# [69] "Endocrinology & Metabolism"                      
# [70] "Physics, Multidisciplinary"                      
# [71] "Integrative & Complementary Medicine"            
# [72] "Materials Science, Composites"                   
# [73] "Green & Sustainable Science & Technology"        
# [74] "Zoology"                                         
# [75] "Engineering, Biomedical"                         
# [76] "Materials Science, Textiles"                     
# [77] "Physiology"                                      
# [78] "Microscopy"                                      
# [79] "Geosciences, Multidisciplinary"                  
# [80] "Anatomy & Morphology"  
```

#### Fractional $x_d$-index
The fractional $x_d$-index is a variant of the $x_d$-index adjusted for per-publication contributing institutions to account for multi-institution bias, i.e., bias due to multiple institutions contributing to a publication which can potentially increase exposure and citations.

For this variant, the input data frame must contain a variable 'inst_count', which gives the number of institutions that contributed to each publication. Since the example data is institution-specific, it does not include a variable giving the number of institutions contributing to each publication. To demonstrate the impact of multi-institutional collaborations, we will create a random variable as appropriate. To compute the fractional $x_d$-index, we use the 'xd_index()' function, and set the 'variant' parameter to "f":

```
# create the 'inst_count' variable inside WoSdata
set.seed(123)
WoSdata$inst_count <- runif(n = 2355, min = 1, max = 10)

# compute fractional xd-index
xd_index(df = WoSdata,
         id = "UT.Unique.WOS.ID",
         cat = "WoS.Categories",
         cit = "Times.Cited.WoS.Core",
         variant = "f",
         plot = FALSE)
```

Output:
```
# $xd.index
# [1] 62
# 
# $xd.categories
# [1] "Materials Science, Multidisciplinary"            
# [2] "Biochemistry & Molecular Biology"                
# [3] "Chemistry, Physical"                             
# [4] "Physics, Applied"                                
# [5] "Physics, Condensed Matter"                       
# [6] "Biophysics"                                      
# [7] "Microbiology"                                    
# [8] "Electrochemistry"                                
# [9] "Biotechnology & Applied Microbiology"            
# [10] "Chemistry, Multidisciplinary"                    
# [11] "Chemistry, Analytical"                           
# [12] "Nanoscience & Nanotechnology"                    
# [13] "Pharmacology & Pharmacy"                         
# [14] "Engineering, Chemical"                           
# [15] "Immunology"                                      
# [16] "Polymer Science"                                 
# [17] "Engineering, Electrical & Electronic"            
# [18] "Chemistry, Applied"                              
# [19] "Materials Science, Biomaterials"                 
# [20] "Metallurgy & Metallurgical Engineering"          
# [21] "Food Science & Technology"                       
# [22] "Spectroscopy"                                    
# [23] "Marine & Freshwater Biology"                     
# [24] "Materials Science, Coatings & Films"             
# [25] "Energy & Fuels"                                  
# [26] "Multidisciplinary Sciences"                      
# [27] "Medicine, Research & Experimental"               
# [28] "Computer Science, Artificial Intelligence"       
# [29] "Oncology"                                        
# [30] "Chemistry, Medicinal"                            
# [31] "Environmental Sciences"                          
# [32] "Nutrition & Dietetics"                           
# [33] "Instruments & Instrumentation"                   
# [34] "Veterinary Sciences"                             
# [35] "Plant Sciences"                                  
# [36] "Materials Science, Ceramics"                     
# [37] "Fisheries"                                       
# [38] "Chemistry, Inorganic & Nuclear"                  
# [39] "Engineering, Environmental"                      
# [40] "Biology"                                         
# [41] "Automation & Control Systems"                    
# [42] "Toxicology"                                      
# [43] "Cell Biology"                                    
# [44] "Computer Science, Interdisciplinary Applications"
# [45] "Public, Environmental & Occupational Health"     
# [46] "Biochemical Research Methods"                    
# [47] "Optics"                                          
# [48] "Agricultural Engineering"                        
# [49] "Engineering, Multidisciplinary"                  
# [50] "Tropical Medicine"                               
# [51] "Mathematics, Interdisciplinary Applications"     
# [52] "Physics, Atomic, Molecular & Chemical"           
# [53] "Computer Science, Information Systems"           
# [54] "Agronomy"                                        
# [55] "Mathematical & Computational Biology"            
# [56] "Telecommunications"                              
# [57] "Mathematics, Applied"                            
# [58] "Genetics & Heredity"                             
# [59] "Chemistry, Organic"                              
# [60] "Crystallography"                                 
# [61] "Infectious Diseases"                             
# [62] "Parasitology"  
```

#### Field-normalised $x_d$-index
The field-normalised $x_d$-index is a variant of the $x_d$-index adjusted for mean field citations to account for field-bias, i.e., bias due to rate of citation being different in different fields or research.

For this variant, the population mean is usually preferred, the mean field citations at the global context. The population means, if available, may be provided as a data frame into the 'mfc' input parameter. However, in the absense of population means, the function will automatically calculate sample means as appropriate. For this example, we will use the sample means to adjust for field-bias. To compute the field-normalised $x_d$-index, we use the 'xd_index()' function, and set the 'variant' parameter to "FN":

```
xd_index(df = WoSdata,
         id = "UT.Unique.WOS.ID",
         cat = "WoS.Categories",
         cit = "Times.Cited.WoS.Core",
         mfc = NULL,
         variant = "FN",
         plot = FALSE)
```

Output:
```
# 'mfc' not provided. Computing category means from provided data.
# Found 2 category(s) with zero variance(s): Radiology, Nuclear Medicine & Medical Imaging; Psychology, Biological
# Replacing with 0.01 to allow index calculations.
# It is recommended to check why category(s) produced zero means.
# $xd.index
# [1] 33
# 
# $xd.categories
# [1] "Materials Science, Multidisciplinary"   "Biochemistry & Molecular Biology"      
# [3] "Physics, Applied"                       "Physics, Condensed Matter"             
# [5] "Chemistry, Physical"                    "Chemistry, Multidisciplinary"          
# [7] "Electrochemistry"                       "Biophysics"                            
# [9] "Engineering, Electrical & Electronic"   "Biotechnology & Applied Microbiology"  
# [11] "Microbiology"                           "Nanoscience & Nanotechnology"          
# [13] "Polymer Science"                        "Immunology"                            
# [15] "Pharmacology & Pharmacy"                "Chemistry, Analytical"                 
# [17] "Engineering, Chemical"                  "Chemistry, Applied"                    
# [19] "Chemistry, Medicinal"                   "Energy & Fuels"                        
# [21] "Marine & Freshwater Biology"            "Plant Sciences"                        
# [23] "Chemistry, Inorganic & Nuclear"         "Cell Biology"                          
# [25] "Materials Science, Coatings & Films"    "Environmental Sciences"                
# [27] "Multidisciplinary Sciences"             "Metallurgy & Metallurgical Engineering"
# [29] "Food Science & Technology"              "Materials Science, Biomaterials"       
# [31] "Spectroscopy"                           "Fisheries"                             
# [33] "Materials Science, Ceramics"           
```

#### Inverse variance weighted $x_d$-index
Similar to the field-normalised $x_d$-index, the inverse variance weighted (IVW) $x_d$-index is a variant of the $x_d$-index adjusted for field citation variance to account for field-bias.

Again, although the population level variance is desireable, provided as a data frame into the'vfc' input parameter, it may be substituted by sample variances when unavailable. For this example, we will use the sample variances to adjust for field-bias. To compute the IVW $x_d$-index, we use the 'ivw_xd_index()' function:

```
ivw_xd_index(df = WoSdata,
             id = "UT.Unique.WOS.ID",
             cat = "WoS.Categories",
             cit = "Times.Cited.WoS.Core",
             vfc = NULL,
             plot = FALSE)
```

Output:
```
# 'vfc' not provided. Computing category variances from provided data.
# Variance cannot be computed for 26 category(s).
# Categories occurring only once are likely to result in NA variances.
# Excluding 26 category(s).
# Found 1 category(s) with zero variance(s): Limnology
# Replacing with '0.01' to allow index calculation.
# It is recommended to check why category(s) produced zero variances.
# $ivw.xd.index
# [1] 9
# 
# $ivw.xd.categories
# [1] "Limnology"                            "Engineering, Industrial"             
# [3] "Meteorology & Atmospheric Sciences"   "Physics, Condensed Matter"           
# [5] "Physics, Applied"                     "Chemistry, Multidisciplinary"        
# [7] "Materials Science, Multidisciplinary" "Engineering, Electrical & Electronic"
# [9] "Biochemistry & Molecular Biology"             
```
#### $h$-index and $g$-index
Finally, any bibliometric package would be incomplete without the traditional $h$- and $g$-indices. Hence, this package also includes the functions 'h_index()' and 'g_index()' to compute the $h$- and $g$-indices, respectively. These are just rebranded versions of similar functions available in the 'agop' R pacakge with the added functionality of an optional plot to maintain consistency within our package. 

### Bug reports and improvements
Bug reports, feature requests, and suggestions for improvement are always welcome. Please report issues and propose enhancements via the project repository or via email (n.das@uq.edu.au). User feedback is essential for the continued development and refinement of this package.
