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
knop = false;

function story(aName)
	if(aName == "start") then
		playSound("intro.WAV")
		CLS()
		setBackground("villa.JPG")
		createTextfield("Je bent op een missie, je moet een diamand gaan stelen")
		createButton("binnen", "Ga naar binnen")
	end

	if(aName == "binnen") then
		if(knop == true) then
			playSound("deur.WAV")
			setBackground("gang.JPG")
			CLS()
			createTextfield("Je staat bij de ingang, je kan meerdere kanten op")
			createButton("rechts", "Ga naar binnen in de rechter kamer.")
			createButton("links", "Ga naar binnen in de linker kamer.")
			createButton("kelder", "Ga naar de kelder.")
		else
			playSound("deur.WAV")
			setBackground("gang.JPG")
			CLS()
			createTextfield("Je staat bij de ingang, je kan meerdere kanten op")
			createButton("kelder2", "Ga naar de kelder.")	
			createButton("zolder", "Ga naar de zolder toe.")
		end
	end

	if(aName == "links") then
		playSound("deur.WAV")
		setBackground("kast.JPG")
		CLS()
		createTextfield("Je ziet een kast voor je staan, wat ga je doen?")
		createButton("binnen", "Ga weer terug naar de ingang.");
		createButton("kastje", "Maak de kast open")
	end

	if(aName == "kastje") then
		playSound("deur.WAV")
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
		playSound("deur.WAV")
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
		playSound("deur.WAV")
		CLS()
		createTextfield("Je hebt de sleutel van de kluis gevonden!")
		sleutelkist = true;
		createButton("binnen", "Ga weer terug naar de ingang")
	end

	if(aName == "gooi") then
		playSound("deur.WAV")
		CLS()
		setBackground("piggystuk.JPG")
		createTextfield("De sleutels van de kast zaten in de spaar pot")
		sleutelkast = true;
		createButton("binnen", "Ga weer terug naar de ingang.")
	end

	if(aName == "kelder") then
		playSound("deur.WAV")
		CLS()
		if(sleutelkelder == true) then
			createTextfield("Je bent in de kelder aangekomen, je ziet een kluis voor je staan maar je kan ook verder ontedekken.")
			createButton("kluis", "Maak de kluis open")
			createButton("ontdekken", "Verder ontdekken in de kelder.")
		else
			createTextfield("Je hebt eerst de sleutel van de kelder nodig.")
			createButton("binnen", "Ga weer terug naar de ingang.")
		end
	end

	if(aName == "kluis") then
		playSound("deur.WAV")
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

	if(aName == "ontdekken") then
		CLS()
		setBackground("hollebollegijs.JPG")
		createTextfield("AAAAH!! Je bent vermoord door holle bolle gijs.")
		createButton("exit", "Opnieuw beginnen.")
	end

	if(aName == "zolder") then
		setBackground("zolder.JPG")
		createTextfield("Je hebt een knop gevonden, wat ga je er mee doen?")
		CLS()
		createButton("binnen", "Ga weer terug naar de ingang.")
		createButton("indrukken", "Druk de rode knop in")
	end

	if(aName == "indrukken") then
		setBackground("knop.JPG")
		CLS()
		knop = true;
		createTextfield("Je hoort deuren open gaan, laten we kijken wat er is gebeurt.")
		createButton("binnen", "Ga terug naar de ingang.")
	end

	if(aName == "kelder2") then
		CLS()
		setBackground("hollebollegijs.JPG")
		createTextfield("AAAAH!! Je bent vermoord door holle bolle gijs.")
		createButton("binnen", "hollebollegijs had honger en heeft je opgegeten.")
	end

	if(aName == "exit") then
		exitGame();
	end 
end