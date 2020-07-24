# Virus_Outbreak_Simulation


In this lectorial task you will be modelling the spread of a ‘virus’ and showing the spread pattern visually 
using MATLAB figure windows.

To show this in MATLAB:

    Create a 100 x 100 zeros matrix, each element of this matrix will represent a person who can be ‘infected’ 
    with the virus (i.e. 10,000 people).
    
    Somewhere in this matrix change a value to ‘1’ to represent ‘patient zero’ of our pandemic.
    
    This infection must spread each day to matrix elements directly north, south, east and west of another 
    infected element (elements diagonal to an infected element can’t catch the virus from that element).
    
    Infection must only spread to elements with one infected neighbour only, if an element has two or more 
    infected neighbours it cannot be infected 
