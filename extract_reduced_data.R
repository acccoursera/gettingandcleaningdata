extract_reduced_data <- function (mergedx){
  
    reduced <- data.frame(mergedx$V2.x,
                        mergedx$V1.1, mergedx$V2.y, mergedx$V3, mergedx$V4, mergedx$V5, mergedx$V6, 
                        mergedx$V41, mergedx$V42, mergedx$V43, mergedx$V44, mergedx$V45, mergedx$V46,
                        mergedx$V81, mergedx$V82, mergedx$V83, mergedx$V84, mergedx$V85, mergedx$V86,
                        mergedx$V121, mergedx$V122, mergedx$V123, mergedx$V124, mergedx$V125, mergedx$V126,
                        mergedx$V161, mergedx$V162, mergedx$V163, mergedx$V164, mergedx$V165, mergedx$V166,
                        mergedx$V201, mergedx$V202, mergedx$V214, mergedx$V215, mergedx$V227, mergedx$V228,
                        mergedx$V240, mergedx$V241, mergedx$V253, mergedx$V254, 
                        mergedx$V266, mergedx$V267, mergedx$V268, mergedx$V269, mergedx$V270, mergedx$V271,
                        mergedx$V345, mergedx$V346, mergedx$V347, mergedx$V348, mergedx$V349, mergedx$V350,
                        mergedx$V424, mergedx$V425, mergedx$V426, mergedx$V427, mergedx$V428, mergedx$V429,
                        mergedx$V503, mergedx$V504, mergedx$V516, mergedx$V517, mergedx$V529, mergedx$V530,
                        mergedx$V542, mergedx$V543, mergedx$V1.2
                    )
    reduced
}