*** Settings ***


*** Variables ***

${OrderConfiremedText}
${ContinueShoppingButton}
${DownloadFileButton}
${ViewOrderButton}



*** Keywords ***

Verify the physical product succesfully orderd
  Page Should Contain Element  ${OrderConfiremedText}
  Page Should Contain Element  ${ContinueShoppingButton}
  Page Should Contain Element  ${ViewOrderButton}

Verify the digital product succesfully orderd
   Page Should Contain Element  ${OrderConfiremedText}
   Page Should Contain Element  ${ContinueShoppingButton}
   Page Should Contain Element  ${DownloadFileButton}

