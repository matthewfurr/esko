rem this batch file copies first the excel file in the AE batch folder, because the export to csv locks the excel file,so the original excel file remains editable, then the batch runs ExcelToCSV.vbs
rem cscript /nologo "C:\Esko\bg_data_fastserverscrrunnt_v100\Scripts\Batch\ExcelToCSV.vbs" "C:\MyExcel.xlsx" "C:\MyExcel.csv"
xcopy %3 "C:\Esko\bg_data_fastserverscrrunnt_v100\Scripts\Batch\" /D /E /I /G /H /R /Y
cscript /nologo "C:\Esko\bg_data_fastserverscrrunnt_v100\Scripts\Batch\ExcelToCSV.vbs" %3 %4

