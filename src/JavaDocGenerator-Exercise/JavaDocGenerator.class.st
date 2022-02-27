"
I generate and save the HTML JavaDoc for a given class to a specified path in the system.

Sibling class references:

- I use ""JavaDocAttributesDocGenerator"" to generate the HTML list of instance variables of the class.  
- I also use ""JavaDocMethodsDocGenerator"" to generate the HTML list of all methods implemented in the class. 

Public API and Key Messages

- for: aClass. Where ""aClass"" is the reference of the class to generate the JavaDoc for.    
- for: aClass saveTo: aPath. Where ""aPath"" is the path in the system where to save the JavaDoc.

Example:

Creating the JavaDoc file with the name ""CustomDoubleLinkedList.html"" in ""C:\Users\<username>\Desktop"".
> JavaDocGenerator new for: CustomDoubleLinkedList saveTo: 'C:\Users\<username>\Desktop'. 


"
Class {
	#name : #JavaDocGenerator,
	#superclass : #Object,
	#category : #'JavaDocGenerator-Exercise'
}

{ #category : #utilities }
JavaDocGenerator >> for: aClass [

	"Generates a HTML JavaDoc for a given class."

^ '
<html>
  <head><title>{1}</title></head>
    <body>
      <h1>{1}</h1>
      <section>
        <h2>Class description</h2>
        <p>{2}</p>
      </section>
      <section>
        <h2>Instance variables</h2>
        <p>{3}</p>
      </section>
      <section>
        <h2>Methods</h2>
        <p>{4}</p>
      </section>
    </body>
</html>
' format: {
			aClass name asString.
			(aClass comment copyReplaceAll: String cr with: '</br>').
			(JavaDocAttributesDocGenerator new for: aClass). 
			(JavaDocMethodsDocGenerator new for: aClass).
		}.
]

{ #category : #utilities }
JavaDocGenerator >> for: aClass saveTo: aPath [

	"
	Generates an saves the HTML JavaDoc for a given class to an absolute path in the system.
	Becareful on Windows systems to use the english paths for the users related directories.
	Do not use the Windows file explorer translated paths.
	Example from a French system: C:\Utilisateurs\<username>\Bureau has to be specified like C:\Users\<username>\Desktop
	"

	| path file |
	path := (FileSystem disk resolveString: aPath) / aClass name , 'html'.
	file := path asFileReference.
	file writeStream
		nextPutAll: (self for: aClass);
		close
]
