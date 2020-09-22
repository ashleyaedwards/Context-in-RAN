#uncorrected data
d = read.csv("uncorrected_raw_data.csv")

#correcting means for flagged trials 
d$meanRAN[d$sub==48]=25.93345
d$meanCP[d$sub==38]=15.408
d$meanCP[d$sub==67]=(20.834185175+21.48429)/2
d$meanCL[d$sub==78]=(21.1843+21.5009)/2
d$meanCL[d$sub==84]=(22.91755+20.55085)/2
d$meanNCP[d$sub==17] = 15.30946
d$meanNCP[d$sub==88] = (17.63264+27.050525449)/2
d$meanCP[d$sub==9] = 22.433
d$meanNCL[d$sub==30] = 22.925
d$meanNCP[d$sub==52]=17.059

write.csv(d, "data_corrected_means.csv", row.names = F)

#correlation comparisons
library(cocor)
cocor.dep.groups.overlap(cor(d$meanCL, d$meanORFwpm), cor(d$meanNCL, d$meanORFwpm), cor(d$meanCL, d$meanNCL), nrow(d))

cocor.dep.groups.overlap(cor(d$meanRAN, d$meanORFwpm), cor(d$meanCL, d$meanORFwpm), cor(d$meanRAN, d$meanCL), nrow(d))

cocor.dep.groups.overlap(cor(d$meanRAN, d$meanORFwpm), cor(d$meanNCL, d$meanORFwpm), cor(d$meanRAN, d$meanNCL), nrow(d))

cocor.dep.groups.overlap(cor(d$meanCP, d$meanORFwpm), cor(d$meanNCP, d$meanORFwpm), cor(d$meanCP, d$meanNCP), nrow(d))

