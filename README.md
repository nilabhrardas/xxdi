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
# A tibble: 6 × 4
  UT.Unique.WOS.ID    Keywords.Plus                        WoS.Categories Times.Cited.WoS.Core
  <chr>               <chr>                                <chr>                         <dbl>
1 WOS:000560355300001 ENCRYPTION; SEARCH                   Computer Scie…                    3
2 WOS:000537414100011 16S RIBOSOMAL-RNA; POSTOPERATIVE EN… Microbiology                      3
3 WOS:000508646000003 BLOOD-PRESSURE VARIABILITY; DIRECT … Pharmacology …                    3
4 WOS:000509674900007 NA                                   Multidiscipli…                    3
5 WOS:000492345900041 C-ELEGANS; MOLECULAR DOCKING; PROTE… Medicine, Res…                    3
6 WOS:000485861500012 CARBON NANOTUBES; CONDUCTING POLYME… Multidiscipli…                    3
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
$x.index
[1] 254

$x.keywords
  [1] "INFECTION"                        "STRAINS"                         
  [3] "MOLECULAR DOCKING"                "PROTEIN"                         
  [5] "CARBON NANOTUBES"                 "POLYPYRROLE"                     
  [7] "NANOPARTICLES"                    "SENSOR"                          
  [9] "COMPOSITE"                        "ANTIBACTERIAL"                   
 [11] "BACTERIA"                         "OPTICAL-PROPERTIES"              
 [13] "PHOTOLUMINESCENCE"                "STABILITY"                       
 [15] "SENSING PROPERTIES"               "ELECTRODE"                       
 [17] "PERFORMANCE"                      "AG"                              
 [19] "NANOSTRUCTURES"                   "NANOCOMPOSITES"                  
 [21] "NANOWIRES"                        "THIN-FILMS"                      
 [23] "ELECTRODES"                       "GRAPHENE OXIDE"                  
 [25] "PROTEINS"                         "RESISTANCE"                      
 [27] "FISH"                             "TEMPERATURE"                     
 [29] "BINDING"                          "INHIBITORS"                      
 [31] "INHIBITION"                       "SYSTEM"                          
 [33] "OXIDE"                            "DISEASE RESISTANCE"              
 [35] "WATER"                            "ELECTRICAL-PROPERTIES"           
 [37] "ORIENTATION"                      "CONSTANTS"                       
 [39] "GOLD NANOPARTICLES"               "DELIVERY"                        
 [41] "CHITOSAN"                         "DERIVATIVES"                     
 [43] "MAGNETIC-PROPERTIES"              "NANOCRYSTALS"                    
 [45] "FACILE SYNTHESIS"                 "EFFICIENT"                       
 [47] "FORCE-FIELD"                      "ACID"                            
 [49] "APOPTOSIS"                        "EXPRESSION"                      
 [51] "DOCKING"                          "ELECTROCHEMICAL PERFORMANCE"     
 [53] "SOLVOTHERMAL SYNTHESIS"           "GROWTH"                          
 [55] "CONDUCTIVITY"                     "MECHANISMS"                      
 [57] "BEHAVIOR"                         "GENE-EXPRESSION"                 
 [59] "SURFACE"                          "CALCINED MATERIALS"              
 [61] "NANOTUBES"                        "EXTRACT"                         
 [63] "DESIGN"                           "OXIDATION"                       
 [65] "RECOGNITION"                      "ANTIOXIDANT"                     
 [67] "LUMINESCENCE"                     "IONIC-CONDUCTIVITY"              
 [69] "FABRICATION"                      "NANOSHEETS"                      
 [71] "MECHANISM"                        "ANTIBIOTICS"                     
 [73] "GENES"                            "NITRIC-OXIDE SYNTHASE"           
 [75] "NF-KAPPA-B"                       "OXIDATIVE STRESS"                
 [77] "DEGRADATION"                      "BIOSENSOR"                       
 [79] "FILM"                             "IN-VITRO"                        
 [81] "GOLD"                             "BIOSENSORS"                      
 [83] "CELLS"                            "ACTIVATION"                      
 [85] "MICROSTRUCTURE"                   "DEPOSITION"                      
 [87] "CO"                               "FILMS"                           
 [89] "CRYSTAL-STRUCTURE"                "CHEMISTRY"                       
 [91] "SUSCEPTIBILITY"                   "IDENTIFICATION"                  
 [93] "DISCOVERY"                        "ALZHEIMERS-DISEASE"              
 [95] "ACCURATE DOCKING"                 "GENE"                            
 [97] "THICKNESS"                        "SPECTROSCOPY"                    
 [99] "ESCHERICHIA-COLI"                 "ANTIBACTERIAL ACTIVITY"          
[101] "WALLED CARBON NANOTUBES"          "VOLTAMMETRIC DETERMINATION"      
[103] "REMOVAL"                          "ADSORPTION"                      
[105] "ANTIMICROBIAL ACTIVITY"           "REDUCTION"                       
[107] "REDUCED GRAPHENE OXIDE"           "GLASSY-CARBON ELECTRODE"         
[109] "BETA-CYCLODEXTRIN"                "MECHANICAL-PROPERTIES"           
[111] "QUANTUM DOTS"                     "MORPHOLOGY"                      
[113] "PH"                               "SILVER NANOPARTICLES"            
[115] "GREEN SYNTHESIS"                  "LEAF EXTRACT"                    
[117] "PHOTOCATALYTIC ACTIVITY"          "HYDROTHERMAL SYNTHESIS"          
[119] "NANOCOMPOSITE"                    "GRAPHENE"                        
[121] "SOL-GEL"                          "ANTIBIOFILM ACTIVITY"            
[123] "ZNO"                              "TOXICITY"                        
[125] "ANTICANCER"                       "PROSTATE-CANCER"                 
[127] "ELECTROCHEMICAL PROPERTIES"       "POLYANILINE"                     
[129] "ASCORBIC-ACID"                    "ZINC-OXIDE NANOPARTICLES"        
[131] "ANTIBIOFILM"                      "INFECTIONS"                      
[133] "INNATE IMMUNITY"                  "BIOSYNTHESIS"                    
[135] "PURIFICATION"                     "CARBON"                          
[137] "SUPERCAPACITOR"                   "ENERGY-STORAGE"                  
[139] "ARRAYS"                           "NANORODS"                        
[141] "PREDICTION"                       "DYNAMICS"                        
[143] "EXPONENTIAL STABILITY"            "SYNCHRONIZATION"                 
[145] "SIZE"                             "MN"                              
[147] "CANCER"                           "BIOFILM FORMATION"               
[149] "PARTICLES"                        "CAENORHABDITIS-ELEGANS"          
[151] "VIRULENCE"                        "MODEL"                           
[153] "INDUCED OXIDATIVE STRESS"         "EFFICACY"                        
[155] "ELECTRODEPOSITION"                "OPTIMIZATION"                    
[157] "GLUTATHIONE"                      "KINETICS"                        
[159] "ROUTE"                            "NANOFIBERS"                      
[161] "TRANSPORT"                        "COMPOSITES"                      
[163] "ELECTRONIC BEHAVIOR"              "TITANIUM-DIOXIDE"                
[165] "ANTICANCER ACTIVITY"              "NITROGEN"                        
[167] "ABSORPTION"                       "STRUCTURAL-CHARACTERIZATION"     
[169] "AQUEOUS EXTRACT"                  "ZNO NANOPARTICLES"               
[171] "MEDIATED SYNTHESIS"               "L."                              
[173] "COMPLEXES"                        "EXTRACTS"                        
[175] "OXIDE NANOPARTICLES"              "THERAPY"                         
[177] "LEAVES"                           "ANTIBIOTIC-RESISTANCE"           
[179] "DRUG-DELIVERY"                    "PSEUDOMONAS-AERUGINOSA"          
[181] "VARYING DELAYS"                   "ROBUST STABILITY"                
[183] "SYNTHESIZED SILVER NANOPARTICLES" "POLYMERIZATION"                  
[185] "STAPHYLOCOCCUS-AUREUS"            "ELECTROCHROMIC PROPERTIES"       
[187] "EXTRACTION"                       "AQUEOUS-SOLUTION"                
[189] "GLOBAL EXPONENTIAL STABILITY"     "CRITERIA"                        
[191] "CATALYTIC-ACTIVITY"               "ESSENTIAL OIL"                   
[193] "MOTILITY"                         "ZINC-OXIDE"                      
[195] "URIC-ACID"                        "SYSTEMS"                         
[197] "SHEETS"                           "IONIC LIQUID"                    
[199] "GEL"                              "CYTOTOXICITY"                    
[201] "PLANT"                            "LUNG-CANCER"                     
[203] "AEDES-AEGYPTI"                    "CULEX-QUINQUEFASCIATUS"          
[205] "VETERINARY IMPORTANCE"            "LIPID-PEROXIDATION"              
[207] "SPRAY-PYROLYSIS"                  "MEDICINAL-PLANTS"                
[209] "MICROSPHERES"                     "RELEASE"                         
[211] "TIO2"                             "NATURAL-PRODUCTS"                
[213] "RAINBOW-TROUT"                    "ESSENTIAL OILS"                  
[215] "SILVER"                           "METAL NANOPARTICLES"             
[217] "RAMAN"                            "DISCRETE"                        
[219] "DRUG DISCOVERY"                   "DOPAMINE"                        
[221] "NITRATE"                          "DYE"                             
[223] "ROOM-TEMPERATURE FERROMAGNETISM"  "COLORECTAL-CANCER"               
[225] "OIL"                              "CURCUMIN"                        
[227] "PHENOLIC-COMPOUNDS"               "IN-VIVO"                         
[229] "ANTIHEMOLYTIC ACTIVITIES"         "PLANTS"                          
[231] "TEXTILES"                         "POWDERS"                         
[233] "ACTIVATED PROTEIN-KINASE"         "SECONDARY METABOLITES"           
[235] "LI-STORAGE"                       "SEMICONDUCTORS"                  
[237] "GENERATION"                       "VIRULENCE FACTORS"               
[239] "HIGH-TEMPERATURE FERROMAGNETISM"  "ELECTRIC PROPERTIES"             
[241] "HUMAN HEPATOCELLULAR-CARCINOMA"   "FACTOR-KAPPA-B"                  
[243] "EPIDERMAL-GROWTH-FACTOR"          "ESTROGEN-RECEPTOR-BETA"          
[245] "CELL-CYCLE ARREST"                "GASTRIC-CANCER"                  
[247] "SOY ISOFLAVONE"                   "ELECTROCATALYTIC REDUCTION"      
[249] "EPITHELIAL-CELLS"                 "SUSPENSIONS"                     
[251] "ACTINOMYCETE"                     "BIOLOGICAL SYNTHESIS"            
[253] "HARVEYI"                          "BREAST-CANCER"                   
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
$xc.index
[1] 251

$xc.keywords
  [1] "ANTIBACTERIAL (Microbiology)"                                          
  [2] "PERFORMANCE (Materials Science, Multidisciplinary)"                    
  [3] "PERFORMANCE (Physics, Applied)"                                        
  [4] "PERFORMANCE (Physics, Condensed Matter)"                               
  [5] "COMPOSITE (Materials Science, Multidisciplinary)"                      
  [6] "COMPOSITE (Physics, Applied)"                                          
  [7] "COMPOSITE (Physics, Condensed Matter)"                                 
  [8] "THIN-FILMS (Chemistry, Physical)"                                      
  [9] "THIN-FILMS (Physics, Condensed Matter)"                                
 [10] "RESISTANCE (Biotechnology & Applied Microbiology)"                     
 [11] "THIN-FILMS (Physics, Applied)"                                         
 [12] "NANOPARTICLES (Engineering, Electrical & Electronic)"                  
 [13] "NANOPARTICLES (Nanoscience & Nanotechnology)"                          
 [14] "NANOPARTICLES (Physics, Applied)"                                      
 [15] "DISEASE RESISTANCE (Fisheries)"                                        
 [16] "OPTICAL-PROPERTIES (Engineering, Electrical & Electronic)"             
 [17] "OPTICAL-PROPERTIES (Materials Science, Multidisciplinary)"             
 [18] "OPTICAL-PROPERTIES (Physics, Applied)"                                 
 [19] "OPTICAL-PROPERTIES (Physics, Condensed Matter)"                        
 [20] "ELECTRICAL-PROPERTIES (Physics, Condensed Matter)"                     
 [21] "PHOTOLUMINESCENCE (Materials Science, Multidisciplinary)"              
 [22] "PHOTOLUMINESCENCE (Physics, Applied)"                                  
 [23] "PHOTOLUMINESCENCE (Physics, Condensed Matter)"                         
 [24] "THIN-FILMS (Materials Science, Multidisciplinary)"                     
 [25] "NANOPARTICLES (Materials Science, Multidisciplinary)"                  
 [26] "NANOPARTICLES (Physics, Condensed Matter)"                             
 [27] "FORCE-FIELD (Biochemistry & Molecular Biology)"                        
 [28] "GOLD NANOPARTICLES (Biochemistry & Molecular Biology)"                 
 [29] "GOLD NANOPARTICLES (Biophysics)"                                       
 [30] "FACILE SYNTHESIS (Materials Science, Multidisciplinary)"               
 [31] "GROWTH (Chemistry, Physical)"                                          
 [32] "GROWTH (Engineering, Chemical)"                                        
 [33] "TEMPERATURE (Materials Science, Multidisciplinary)"                    
 [34] "TEMPERATURE (Physics, Applied)"                                        
 [35] "TEMPERATURE (Physics, Condensed Matter)"                               
 [36] "OXIDATION (Chemistry, Physical)"                                       
 [37] "FABRICATION (Materials Science, Multidisciplinary)"                    
 [38] "FABRICATION (Physics, Applied)"                                        
 [39] "FABRICATION (Physics, Condensed Matter)"                               
 [40] "BIOSENSOR (Chemistry, Analytical)"                                     
 [41] "SENSOR (Chemistry, Analytical)"                                        
 [42] "FABRICATION (Chemistry, Analytical)"                                   
 [43] "FILM (Chemistry, Analytical)"                                          
 [44] "IN-VITRO (Biochemistry & Molecular Biology)"                           
 [45] "IN-VITRO (Biotechnology & Applied Microbiology)"                       
 [46] "CELLS (Biochemistry & Molecular Biology)"                              
 [47] "COMPOSITE (Chemistry, Physical)"                                       
 [48] "GROWTH (Materials Science, Multidisciplinary)"                         
 [49] "GROWTH (Physics, Applied)"                                             
 [50] "DEPOSITION (Materials Science, Multidisciplinary)"                     
 [51] "DEPOSITION (Physics, Applied)"                                         
 [52] "CO (Chemistry, Physical)"                                              
 [53] "TEMPERATURE (Chemistry, Physical)"                                     
 [54] "PROTEIN (Biochemistry & Molecular Biology)"                            
 [55] "IDENTIFICATION (Biochemistry & Molecular Biology)"                     
 [56] "MECHANISM (Biochemistry & Molecular Biology)"                          
 [57] "DOCKING (Biochemistry & Molecular Biology)"                            
 [58] "DOCKING (Biophysics)"                                                  
 [59] "ANTIBACTERIAL ACTIVITY (Immunology)"                                   
 [60] "GROWTH (Physics, Condensed Matter)"                                    
 [61] "BEHAVIOR (Materials Science, Multidisciplinary)"                       
 [62] "BEHAVIOR (Physics, Condensed Matter)"                                  
 [63] "QUANTUM DOTS (Nanoscience & Nanotechnology)"                           
 [64] "MORPHOLOGY (Materials Science, Multidisciplinary)"                     
 [65] "SILVER NANOPARTICLES (Chemistry, Physical)"                            
 [66] "IN-VITRO (Microbiology)"                                               
 [67] "APOPTOSIS (Biochemistry & Molecular Biology)"                          
 [68] "PERFORMANCE (Chemistry, Physical)"                                     
 [69] "PERFORMANCE (Electrochemistry)"                                        
 [70] "GREEN SYNTHESIS (Engineering, Chemical)"                               
 [71] "LEAF EXTRACT (Engineering, Chemical)"                                  
 [72] "NANOPARTICLES (Chemistry, Multidisciplinary)"                          
 [73] "BINDING (Biochemistry & Molecular Biology)"                            
 [74] "INNATE IMMUNITY (Marine & Freshwater Biology)"                         
 [75] "BIOSYNTHESIS (Biotechnology & Applied Microbiology)"                   
 [76] "NANORODS (Nanoscience & Nanotechnology)"                               
 [77] "NANORODS (Materials Science, Multidisciplinary)"                       
 [78] "CARBON (Materials Science, Multidisciplinary)"                         
 [79] "OXIDE (Materials Science, Multidisciplinary)"                          
 [80] "RECOGNITION (Biochemistry & Molecular Biology)"                        
 [81] "OXIDE (Electrochemistry)"                                              
 [82] "PARTICLES (Materials Science, Multidisciplinary)"                      
 [83] "FISH (Fisheries)"                                                      
 [84] "EXTRACT (Biochemistry & Molecular Biology)"                            
 [85] "ESCHERICHIA-COLI (Microbiology)"                                       
 [86] "EXPRESSION (Microbiology)"                                             
 [87] "FILMS (Physics, Applied)"                                              
 [88] "BIOSYNTHESIS (Materials Science, Multidisciplinary)"                   
 [89] "FILMS (Materials Science, Multidisciplinary)"                          
 [90] "ANTIOXIDANT (Biochemistry & Molecular Biology)"                        
 [91] "IN-VITRO (Medicine, Research & Experimental)"                          
 [92] "IN-VITRO (Pharmacology & Pharmacy)"                                    
 [93] "GREEN SYNTHESIS (Materials Science, Multidisciplinary)"                
 [94] "ELECTRONIC BEHAVIOR (Materials Science, Multidisciplinary)"            
 [95] "CALCINED MATERIALS (Materials Science, Multidisciplinary)"             
 [96] "BIOSYNTHESIS (Microbiology)"                                           
 [97] "IDENTIFICATION (Biotechnology & Applied Microbiology)"                 
 [98] "NANOPARTICLES (Polymer Science)"                                       
 [99] "ANTIBACTERIAL ACTIVITY (Pharmacology & Pharmacy)"                      
[100] "ANTIOXIDANT (Pharmacology & Pharmacy)"                                 
[101] "SILVER NANOPARTICLES (Biochemistry & Molecular Biology)"               
[102] "GREEN SYNTHESIS (Biochemistry & Molecular Biology)"                    
[103] "PSEUDOMONAS-AERUGINOSA (Biotechnology & Applied Microbiology)"         
[104] "PSEUDOMONAS-AERUGINOSA (Microbiology)"                                 
[105] "INFECTIONS (Microbiology)"                                             
[106] "RESISTANCE (Microbiology)"                                             
[107] "ANTIBACTERIAL ACTIVITY (Biochemistry & Molecular Biology)"             
[108] "ANTIBACTERIAL ACTIVITY (Biophysics)"                                   
[109] "INHIBITION (Pharmacology & Pharmacy)"                                  
[110] "IN-VITRO (Immunology)"                                                 
[111] "ESCHERICHIA-COLI (Immunology)"                                         
[112] "OPTICAL-PROPERTIES (Chemistry, Physical)"                              
[113] "BIOFILM FORMATION (Biochemistry & Molecular Biology)"                  
[114] "EXPRESSION (Medicine, Research & Experimental)"                        
[115] "ZNO NANOPARTICLES (Biochemistry & Molecular Biology)"                  
[116] "LEAF EXTRACT (Biochemistry & Molecular Biology)"                       
[117] "BIOSYNTHESIS (Biochemistry & Molecular Biology)"                       
[118] "MN (Materials Science, Multidisciplinary)"                             
[119] "IN-VITRO (Marine & Freshwater Biology)"                                
[120] "ACID (Biotechnology & Applied Microbiology)"                           
[121] "SILVER NANOPARTICLES (Materials Science, Multidisciplinary)"           
[122] "ZINC-OXIDE (Materials Science, Multidisciplinary)"                     
[123] "BIOFILM FORMATION (Immunology)"                                        
[124] "BIOFILM FORMATION (Microbiology)"                                      
[125] "IDENTIFICATION (Microbiology)"                                         
[126] "BIOSYNTHESIS (Immunology)"                                             
[127] "GLASSY-CARBON ELECTRODE (Chemistry, Physical)"                         
[128] "APOPTOSIS (Biotechnology & Applied Microbiology)"                      
[129] "FABRICATION (Electrochemistry)"                                        
[130] "OXIDATIVE STRESS (Pharmacology & Pharmacy)"                            
[131] "OXIDATIVE STRESS (Biochemistry & Molecular Biology)"                   
[132] "CO (Materials Science, Multidisciplinary)"                             
[133] "INHIBITION (Biotechnology & Applied Microbiology)"                     
[134] "INHIBITION (Microbiology)"                                             
[135] "EXPRESSION (Biotechnology & Applied Microbiology)"                     
[136] "NANOPARTICLES (Chemistry, Physical)"                                   
[137] "BIOSYNTHESIS (Engineering, Chemical)"                                  
[138] "ANTIBACTERIAL (Biochemistry & Molecular Biology)"                      
[139] "ANTIBACTERIAL (Engineering, Chemical)"                                 
[140] "ZINC-OXIDE NANOPARTICLES (Biochemistry & Molecular Biology)"           
[141] "ZINC-OXIDE NANOPARTICLES (Biophysics)"                                 
[142] "SILVER NANOPARTICLES (Biophysics)"                                     
[143] "BEHAVIOR (Chemistry, Physical)"                                        
[144] "GREEN SYNTHESIS (Biophysics)"                                          
[145] "GROWTH (Biochemistry & Molecular Biology)"                             
[146] "SPECTROSCOPY (Chemistry, Physical)"                                    
[147] "NANOPARTICLES (Chemistry, Analytical)"                                 
[148] "FILMS (Electrochemistry)"                                              
[149] "NANOSTRUCTURES (Electrochemistry)"                                     
[150] "CULEX-QUINQUEFASCIATUS (Biochemistry & Molecular Biology)"             
[151] "BIOSENSOR (Electrochemistry)"                                          
[152] "NANOPARTICLES (Biochemistry & Molecular Biology)"                      
[153] "ASCORBIC-ACID (Electrochemistry)"                                      
[154] "NANOPARTICLES (Electrochemistry)"                                      
[155] "NANOPARTICLES (Engineering, Chemical)"                                 
[156] "PERFORMANCE (Energy & Fuels)"                                          
[157] "NF-KAPPA-B (Pharmacology & Pharmacy)"                                  
[158] "BIOSENSORS (Electrochemistry)"                                         
[159] "PHOTOLUMINESCENCE (Nanoscience & Nanotechnology)"                      
[160] "ANTIBACTERIAL (Physics, Applied)"                                      
[161] "ASCORBIC-ACID (Chemistry, Analytical)"                                 
[162] "DOPAMINE (Chemistry, Analytical)"                                      
[163] "RAINBOW-TROUT (Fisheries)"                                             
[164] "ACID (Chemistry, Analytical)"                                          
[165] "WATER (Chemistry, Physical)"                                           
[166] "IN-VITRO (Multidisciplinary Sciences)"                                 
[167] "SILVER NANOPARTICLES (Engineering, Chemical)"                          
[168] "ZINC-OXIDE (Chemistry, Physical)"                                      
[169] "DISEASE RESISTANCE (Immunology)"                                       
[170] "RAINBOW-TROUT (Immunology)"                                            
[171] "SPECTROSCOPY (Materials Science, Multidisciplinary)"                   
[172] "CO (Nanoscience & Nanotechnology)"                                     
[173] "GROWTH (Biotechnology & Applied Microbiology)"                         
[174] "GREEN SYNTHESIS (Immunology)"                                          
[175] "GREEN SYNTHESIS (Microbiology)"                                        
[176] "ACID (Biophysics)"                                                     
[177] "SENSOR (Electrochemistry)"                                             
[178] "BIOSYNTHESIS (Physics, Applied)"                                       
[179] "CARBON (Chemistry, Physical)"                                          
[180] "NANOPARTICLES (Biophysics)"                                            
[181] "SENSING PROPERTIES (Chemistry, Physical)"                              
[182] "NANORODS (Chemistry, Physical)"                                        
[183] "LEAF EXTRACT (Biophysics)"                                             
[184] "SILVER NANOPARTICLES (Physics, Applied)"                               
[185] "QUANTUM DOTS (Materials Science, Multidisciplinary)"                   
[186] "MN (Chemistry, Physical)"                                              
[187] "WATER (Engineering, Environmental)"                                    
[188] "WATER (Engineering, Chemical)"                                         
[189] "LI-STORAGE (Chemistry, Physical)"                                      
[190] "SEMICONDUCTORS (Materials Science, Multidisciplinary)"                 
[191] "ZINC-OXIDE (Nanoscience & Nanotechnology)"                             
[192] "FACILE SYNTHESIS (Chemistry, Physical)"                                
[193] "VIRULENCE FACTORS (Microbiology)"                                      
[194] "HIGH-TEMPERATURE FERROMAGNETISM (Chemistry, Physical)"                 
[195] "HIGH-TEMPERATURE FERROMAGNETISM (Nanoscience & Nanotechnology)"        
[196] "HIGH-TEMPERATURE FERROMAGNETISM (Materials Science, Multidisciplinary)"
[197] "ELECTRIC PROPERTIES (Chemistry, Physical)"                             
[198] "ELECTRIC PROPERTIES (Nanoscience & Nanotechnology)"                    
[199] "ELECTRIC PROPERTIES (Materials Science, Multidisciplinary)"            
[200] "QUANTUM DOTS (Chemistry, Physical)"                                    
[201] "MN (Nanoscience & Nanotechnology)"                                     
[202] "PHOTOLUMINESCENCE (Chemistry, Physical)"                               
[203] "SEMICONDUCTORS (Chemistry, Physical)"                                  
[204] "SEMICONDUCTORS (Nanoscience & Nanotechnology)"                         
[205] "SPECTROSCOPY (Nanoscience & Nanotechnology)"                           
[206] "HUMAN HEPATOCELLULAR-CARCINOMA (Nutrition & Dietetics)"                
[207] "FACTOR-KAPPA-B (Nutrition & Dietetics)"                                
[208] "EPIDERMAL-GROWTH-FACTOR (Nutrition & Dietetics)"                       
[209] "ESTROGEN-RECEPTOR-BETA (Nutrition & Dietetics)"                        
[210] "CELL-CYCLE ARREST (Nutrition & Dietetics)"                             
[211] "GASTRIC-CANCER (Nutrition & Dietetics)"                                
[212] "LUNG-CANCER (Nutrition & Dietetics)"                                   
[213] "SOY ISOFLAVONE (Nutrition & Dietetics)"                                
[214] "COLORECTAL-CANCER (Nutrition & Dietetics)"                             
[215] "PROSTATE-CANCER (Nutrition & Dietetics)"                               
[216] "GLASSY-CARBON ELECTRODE (Engineering, Environmental)"                  
[217] "GLASSY-CARBON ELECTRODE (Engineering, Chemical)"                       
[218] "ELECTROCATALYTIC REDUCTION (Chemistry, Physical)"                      
[219] "ELECTROCATALYTIC REDUCTION (Engineering, Environmental)"               
[220] "ELECTROCATALYTIC REDUCTION (Engineering, Chemical)"                    
[221] "SENSING PROPERTIES (Engineering, Environmental)"                       
[222] "SENSING PROPERTIES (Engineering, Chemical)"                            
[223] "IONIC LIQUID (Chemistry, Physical)"                                    
[224] "IONIC LIQUID (Engineering, Environmental)"                             
[225] "IONIC LIQUID (Engineering, Chemical)"                                  
[226] "LI-STORAGE (Engineering, Environmental)"                               
[227] "LI-STORAGE (Engineering, Chemical)"                                    
[228] "NITRATE (Chemistry, Physical)"                                         
[229] "NITRATE (Engineering, Environmental)"                                  
[230] "NITRATE (Engineering, Chemical)"                                       
[231] "FILM (Chemistry, Physical)"                                            
[232] "FILM (Engineering, Environmental)"                                     
[233] "FILM (Engineering, Chemical)"                                          
[234] "OXIDATION (Engineering, Environmental)"                                
[235] "OXIDATION (Engineering, Chemical)"                                     
[236] "COMPOSITE (Engineering, Environmental)"                                
[237] "COMPOSITE (Engineering, Chemical)"                                     
[238] "INDUCED OXIDATIVE STRESS (Pharmacology & Pharmacy)"                    
[239] "VIRULENCE (Food Science & Technology)"                                 
[240] "INFECTIONS (Food Science & Technology)"                                
[241] "GENERATION (Multidisciplinary Sciences)"                               
[242] "IN-VITRO (Food Science & Technology)"                                  
[243] "ZINC-OXIDE (Materials Science, Biomaterials)"                          
[244] "MECHANISM (Materials Science, Biomaterials)"                           
[245] "ZINC-OXIDE NANOPARTICLES (Engineering, Chemical)"                      
[246] "ANTIOXIDANT (Engineering, Chemical)"                                   
[247] "SILVER NANOPARTICLES (Nanoscience & Nanotechnology)"                   
[248] "BIOFILM FORMATION (Medicine, Research & Experimental)"                 
[249] "IDENTIFICATION (Medicine, Research & Experimental)"                    
[250] "APOPTOSIS (Chemistry, Applied)"                                        
[251] "DISEASE RESISTANCE (Marine & Freshwater Biology)"                      
[252] "DISEASE RESISTANCE (Veterinary Sciences)"                              
[253] "INNATE IMMUNITY (Fisheries)"                                           
[254] "INNATE IMMUNITY (Immunology)"                                          
[255] "INNATE IMMUNITY (Veterinary Sciences)"                                 
[256] "BIOSYNTHESIS (Spectroscopy)"                                           
[257] "BIOSYNTHESIS (Biophysics)"                                             
[258] "SILVER NANOPARTICLES (Materials Science, Biomaterials)"                
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
$xd.index
[1] 80

$xd.categories
 [1] "Computer Science, Information Systems"            "Engineering, Electrical & Electronic"            
 [3] "Telecommunications"                               "Microbiology"                                    
 [5] "Pharmacology & Pharmacy"                          "Medicine, Research & Experimental"               
 [7] "Multidisciplinary Sciences"                       "Immunology"                                      
 [9] "Metallurgy & Metallurgical Engineering"           "Chemistry, Inorganic & Nuclear"                  
[11] "Chemistry, Organic"                               "Chemistry, Multidisciplinary"                    
[13] "Nanoscience & Nanotechnology"                     "Materials Science, Multidisciplinary"            
[15] "Physics, Applied"                                 "Physics, Condensed Matter"                       
[17] "Geosciences, Multidisciplinary"                   "Chemistry, Physical"                             
[19] "Biotechnology & Applied Microbiology"             "Biochemistry & Molecular Biology"                
[21] "Chemistry, Applied"                               "Polymer Science"                                 
[23] "Food Science & Technology"                        "Chemistry, Medicinal"                            
[25] "Fisheries"                                        "Biochemical Research Methods"                    
[27] "Computer Science, Interdisciplinary Applications" "Crystallography"                                 
[29] "Mathematical & Computational Biology"             "Biophysics"                                      
[31] "Energy & Fuels"                                   "Engineering, Chemical"                           
[33] "Environmental Sciences"                           "Toxicology"                                      
[35] "Neurosciences"                                    "Chemistry, Analytical"                           
[37] "Optics"                                           "Materials Science, Composites"                   
[39] "Biology"                                          "Public, Environmental & Occupational Health"     
[41] "Tropical Medicine"                                "Materials Science, Ceramics"                     
[43] "Spectroscopy"                                     "Cell Biology"                                    
[45] "Electrochemistry"                                 "Genetics & Heredity"                             
[47] "Materials Science, Textiles"                      "Marine & Freshwater Biology"                     
[49] "Mathematics"                                      "Mathematics, Applied"                            
[51] "Physics, Atomic, Molecular & Chemical"            "Instruments & Instrumentation"                   
[53] "Engineering, Multidisciplinary"                   "Green & Sustainable Science & Technology"        
[55] "Oncology"                                         "Physics, Multidisciplinary"                      
[57] "Mathematics, Interdisciplinary Applications"      "Materials Science, Coatings & Films"             
[59] "Anatomy & Morphology"                             "Microscopy"                                      
[61] "Water Resources"                                  "Plant Sciences"                                  
[63] "Computer Science, Artificial Intelligence"        "Computer Science, Software Engineering"          
[65] "Computer Science, Theory & Methods"               "Infectious Diseases"                             
[67] "Parasitology"                                     "Zoology"                                         
[69] "Agronomy"                                         "Medical Laboratory Technology"                   
[71] "Veterinary Sciences"                              "Automation & Control Systems"                    
[73] "Materials Science, Biomaterials"                  "Endocrinology & Metabolism"                      
[75] "Agricultural Engineering"                         "Engineering, Environmental"                      
[77] "Nutrition & Dietetics"                            "Integrative & Complementary Medicine"            
[79] "Physiology"                                       "Engineering, Biomedical"                         
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
$xd.index
[1] 62

$xd.categories
 [1] "Computer Science, Information Systems"            "Engineering, Electrical & Electronic"            
 [3] "Telecommunications"                               "Microbiology"                                    
 [5] "Pharmacology & Pharmacy"                          "Medicine, Research & Experimental"               
 [7] "Multidisciplinary Sciences"                       "Immunology"                                      
 [9] "Metallurgy & Metallurgical Engineering"           "Chemistry, Inorganic & Nuclear"                  
[11] "Chemistry, Organic"                               "Chemistry, Multidisciplinary"                    
[13] "Nanoscience & Nanotechnology"                     "Materials Science, Multidisciplinary"            
[15] "Physics, Applied"                                 "Physics, Condensed Matter"                       
[17] "Chemistry, Physical"                              "Biotechnology & Applied Microbiology"            
[19] "Biochemistry & Molecular Biology"                 "Chemistry, Applied"                              
[21] "Polymer Science"                                  "Food Science & Technology"                       
[23] "Chemistry, Medicinal"                             "Fisheries"                                       
[25] "Biochemical Research Methods"                     "Computer Science, Interdisciplinary Applications"
[27] "Crystallography"                                  "Mathematical & Computational Biology"            
[29] "Biophysics"                                       "Energy & Fuels"                                  
[31] "Engineering, Chemical"                            "Environmental Sciences"                          
[33] "Toxicology"                                       "Neurosciences"                                   
[35] "Chemistry, Analytical"                            "Optics"                                          
[37] "Biology"                                          "Public, Environmental & Occupational Health"     
[39] "Tropical Medicine"                                "Materials Science, Ceramics"                     
[41] "Spectroscopy"                                     "Cell Biology"                                    
[43] "Electrochemistry"                                 "Genetics & Heredity"                             
[45] "Marine & Freshwater Biology"                      "Mathematics, Applied"                            
[47] "Physics, Atomic, Molecular & Chemical"            "Instruments & Instrumentation"                   
[49] "Engineering, Multidisciplinary"                   "Oncology"                                        
[51] "Mathematics, Interdisciplinary Applications"      "Materials Science, Coatings & Films"             
[53] "Plant Sciences"                                   "Computer Science, Artificial Intelligence"       
[55] "Infectious Diseases"                              "Parasitology"                                    
[57] "Agronomy"                                         "Veterinary Sciences"                             
[59] "Automation & Control Systems"                     "Materials Science, Biomaterials"                 
[61] "Agricultural Engineering"                         "Engineering, Environmental"                      
[63] "Nutrition & Dietetics"                           

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
'mfc' not provided. Computing category means from provided data.
Found zero mean citations for 2 category(s).
Replacing with 0.01 to allow index calculations.
It is recommended to check why category(s) produced zero means.
$xd.index
[1] 33

$xd.categories
 [1] "Engineering, Electrical & Electronic"   "Microbiology"                          
 [3] "Pharmacology & Pharmacy"                "Multidisciplinary Sciences"            
 [5] "Immunology"                             "Metallurgy & Metallurgical Engineering"
 [7] "Chemistry, Inorganic & Nuclear"         "Chemistry, Multidisciplinary"          
 [9] "Nanoscience & Nanotechnology"           "Materials Science, Multidisciplinary"  
[11] "Physics, Applied"                       "Physics, Condensed Matter"             
[13] "Chemistry, Physical"                    "Biotechnology & Applied Microbiology"  
[15] "Biochemistry & Molecular Biology"       "Chemistry, Applied"                    
[17] "Polymer Science"                        "Food Science & Technology"             
[19] "Chemistry, Medicinal"                   "Fisheries"                             
[21] "Biophysics"                             "Energy & Fuels"                        
[23] "Engineering, Chemical"                  "Environmental Sciences"                
[25] "Chemistry, Analytical"                  "Materials Science, Ceramics"           
[27] "Spectroscopy"                           "Cell Biology"                          
[29] "Electrochemistry"                       "Marine & Freshwater Biology"           
[31] "Materials Science, Coatings & Films"    "Plant Sciences"                        
[33] "Materials Science, Biomaterials"       
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
'vfc' not provided. Computing category variances from provided data.
Variance cannot be computed for 44 category(s).
Categories occurring only once are likely to result in NA variances.
Excluding 44 category(s).
Found 2 category(s) with zero variance(s).
Replacing with '0.01' to allow index calculation.
It is recommended to check why category(s) produced zero variances.
$ivw.xd.index
[1] 11

$ivw.xd.categories
 [1] "Engineering, Electrical & Electronic"          "Chemistry, Multidisciplinary"                 
 [3] "Materials Science, Multidisciplinary"          "Physics, Applied"                             
 [5] "Physics, Condensed Matter"                     "Biochemistry & Molecular Biology"             
 [7] "Materials Science, Textiles"                   "Oceanography"                                 
 [9] "Meteorology & Atmospheric Sciences"            "Materials Science, Characterization & Testing"
[11] "Limnology"             
```
#### $h$-index and $g$-index
Finally, any bibliometric package would be incomplete without the traditional $h$- and $g$-indices. Hence, this package also includes the functions 'h_index()' and 'g_index()' to compute the $h$- and $g$-indices, respectively. These are just rebranded versions of similar functions available in the 'agop' R pacakge with the added functionality of an optional plot to maintain consistency within our package. 

### Bug reports and improvements
Bug reports, feature requests, and suggestions for improvement are always welcome. Please report issues and propose enhancements via the project repository or via email (n.das@uq.edu.au). User feedback is essential for the continued development and refinement of this package.
