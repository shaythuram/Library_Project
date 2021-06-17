# Library_Project

Solidity Contract Functions :

addbook :  Add a book with a given title and set the total number of said books in circulation.<br>
gettitlestatus: Check if title is available to be borrowed.<br>
getremainingnumofbooks : Check how many books of said title remains.<br>
Borrow : Borrow Book.<br>
Return : Return Book.<br>

returnCatalogue : List books in library , returns an array of titles. # Removed 

listBooks : Returns a Struct Catlogue. Struct contains an array of strings and a bool called flag.  The flag is always  false so we can filter that out from the JS side with an if else clause.
