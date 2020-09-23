function main(inputs, outputFolder, params){
    
    app.userInteractionLevel = UserInteractionLevel.DONTDISPLAYALERTS
    var aiDoc = app.open(File(inputs[0]))
        
    try{
        var saveOpts = new IllustratorSaveOptions();
            saveOpts.compatibility = Compatibility.ILLUSTRATOR17
            saveOpts.pdfCompatible = true
            
        $.writeln("Saving with the following options: \n \
                    Compatibility: ILLUSTRATOR17 \n \
                    PDFCompatible: TRUE \n")

            aiDoc.saveAs(aiDoc.fullName, saveOpts);
            
        }
    catch(e){
        $.writeln("Error Name: " + e.name);
        $.writeln("Error Message: " + e.message)
        aiDoc.close(SaveOptions.DONOTSAVECHANGES)
        aiDoc = null
        return "Error"
        }
    aiDoc.save()
    aiDoc.close()
    aiDoc = null
    
    return "OK"
    
    }
