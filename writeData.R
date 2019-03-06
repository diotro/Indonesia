writeData <- function(openVA_obj, odk_data, top = 3, file_name){

    probs <- getIndivProb(openVA_obj)
    cods  <- colnames(probs)

    out <- matrix(NA, nrow=nrow(probs), ncol=top*2)

    for(i in 1:nrow(probs)){
        probsOrdered <- order(probs[i,], decreasing=TRUE)
        newTop <- top
        if(length(unique(probsOrdered)) <= top) newTop = (top-1)
        if(newTop < 1){
            cat("Error: not enough unique causes \n")
            next
        }
        for(j in 1:newTop){
            k <- seq(1, top*2, by=2)[j]
            out[i,k  ] <- cods[probsOrdered[j]]
            out[i,k+1] <- round(probs[i, probsOrdered[j]],4)
        }
    }
    out <- cbind(rownames(probs), out)
    keep <- match(as.character(openVA_obj$id), as.character(odk_data$ID))

    out2 <- cbind(out, odk_data[keep, -1])

    causeLabs <- c(
        rbind( paste("Cause with rank:", 1:top),
               paste("Prob for Cause with rank", 1:top)
              ) )

    colnames(out2) <- c("ID", causeLabs, names(odk_data)[-1])
    write.csv(out2, file = file_name, row.names = FALSE)
}

writeTable <- function(openVA_obj, top = 10, file_name){
    write.csv(
        summary(openVA_obj)$csmf[1:top,],
        file = file_name,
        row.names = TRUE
    )
}
