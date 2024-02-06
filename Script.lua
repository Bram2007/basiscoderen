--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--

sleutelkast = false;
sleutelkelder = false;
sleutelkist = false;
eerstekeer = false;

function story(aName)
	if(aName == "start") then
		CLS()
		setBackground("villa.JPG")
		createTextfield("Je bent op een missie, je moet een diamand gaan stelen")
		createButton("binnen", "Ga naar binnen")
	end
	if(aName == "binnen") then
		setBackground("gang.JPG")
		CLS()
		createTextfield("Je staat bij de ingang, je kan meerdere kanten op")
		createButton("rechts", "Ga naar binnen in de rechter kamer.")
		createButton("links", "Ga naar binnen in de linker kamer.")
		createButton("kelder", "Ga naar de kelder.")
	end
	if(aName == "links") then
		setBackground("kast.JPG")
		CLS()
		createTextfield("Je ziet een kast voor je staan, wat ga je doen?")
		createButton("binnen", "Ga weer terug naar de ingang.");
		createButton("kastje", "Maak de kast open")
	end
	if(aName == "kastje") then
		CLS()
		if(sleutelkast == true) then
			setBackground("kastopen.JPG")
			createTextfield("Je hebt de sleutel van de Kelder gevonden")
			sleutelkelder = true;
			createButton("binnen", "Ga weer terug naar de ingang.")
		else
			setBackground("kast.JPG")
			createTextfield("Je hebt een sleutel nodig om deze kast te openen.")
			createButton("binnen", "Ga weer terug naar de ingang.")
		end
	end
	if(aName == "rechts") then
		CLS()
		if(sleutelkelder == true) then
			setBackground("tapijt.JPG")
			createTextfield("Hmm, er ligt een tapijt, de sleutel kan daar onder liggen.")
			createButton("binnen", "Ga weer terug naar de ingang.")
			createButton("zoek", "Onder het tapijt kijken")
		else
			setBackground("spaarpot.JPG")
			createTextfield("Je hebt een spaar pot gevonden!")
			createButton("binnen", "ga weer terug naar de ingang.")		
			createButton("gooi", "Gooi de spaarpot stuk")
		end
	end
	if(aName == "zoek") then
		CLS()
		createTextfield("Je hebt de sleutel van de kluis gevonden!")
		sleutelkist = true;
		createButton("binnen", "Ga weer terug naar de ingang")
	end
	if(aName == "gooi") then
		CLS()
		createTextfield("De sleutels van de kast zaten in de spaar pot")
		sleutelkast = true;
		createButton("binnen", "Ga weer terug naar de ingang.")
	end
	if(aName == "kelder") then
	CLS()
		if(sleutelkelder == true) then
			createTextfield("Je hebt de kluis gevonden!")
			createButton("kluis", "Maak de kluis open")
		else
			createTextfield("Je hebt eerst de sleutel van de kelder nodig.")
			createButton("binnen", "Ga weer terug naar de ingang.")
		end
	end
	if(aName == "kluis") then
		CLS()
		if(sleutelkist == true) then
			setBackground("kluisopen.JPG")
			createTextfield("Je hebt de diamand gevonden!")
			createButton("exit", "Ga snel met de buit naar buiten.")
		else
			setBackground("kluisdicht.JPG")
			createTextfield("Je hebt eerst de sleutel van de kluis nodig.")
			createButton("binnen", "Ga weer terug naar de ingang.")
		end
	end
	if(aName == "exit") then
		exitGame();
	end 
end