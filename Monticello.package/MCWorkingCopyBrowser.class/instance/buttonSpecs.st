morphic ui
buttonSpecs
       ^ #(
               ('+Package' addWorkingCopy 'Add a new package and make it the working copy')
               (Browse browseWorkingCopy 'Browse the working copy of the selected package' hasWorkingCopy)
               (Scripts editLoadScripts 'Edit the load/unload scripts of this package' hasWorkingCopy)
               (History viewHistory 'View the working copy''s history' hasWorkingCopy)
               (Changes viewChanges 'View the working copy''s changes relative to the installed version from the repository' canSave)
               (Backport backportChanges 'Backport the working copy''s changes to an ancestor' canBackport)
               (Save saveVersion 'Save the working copy as a new version to the selected repository' canSave)
             ('+Repository' addRepository 'Add an existing repository to the list of those visible')
               (Open openRepository 'Open a browser on the selected repository' hasRepository)
               )