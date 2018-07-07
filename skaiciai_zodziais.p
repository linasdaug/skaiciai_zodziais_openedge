function iki20 returns character (input iSk as integer): 
 case iSk: 
   when 1 then return "vienas".
   when 2 then return "du".
   when 3 then return "trys".
   when 4 then return "keturi".
   when 5 then return "penki".
   when 6 then return "ğeği".
   when 7 then return "septyni".
   when 8 then return "ağtuoni".
   when 9 then return "devyni".
   when 10 then return "değimt".
   when 11 then return "vienuolika".
   when 12 then return "dvylika".
   when 13 then return "trylika".
   when 14 then return "keturiolika".
   when 15 then return "penkiolika".
   when 16 then return "ğeğiolika".
   when 17 then return "septyniolika".
   when 18 then return "ağtuoniolika".
   when 19 then return "devyniolika".
   otherwise return "".
 end.
end.

function desimtys returns character (input iSk as integer): 
 case iSk: 
   when 2 then return "dvideğimt".
   when 3 then return "trisdeğimt".
   when 4 then return "keturiasdeğimt".
   when 5 then return "penkiasdeğimt".
   when 6 then return "ğeğiasdeğimt".
   when 7 then return "septyniasdeğimt".
   when 8 then return "ağtuoniasdeğimt".
   when 9 then return "devyniasdeğimt".
   otherwise return "".
 end.
end.



function iki999 returns character (input iSk as integer):
    
  define variable iZ as character no-undo init "".
  define variable iTemp as integer no-undo.
    
  if iSk < 20 then
    iZ = iki20(iSk).
  else if iSk >= 20 and iSk <= 99 then do:
    iZ = desimtys(integer(truncate(iSk / 10, 0))) + " " + iki20(iSk mod 10).
    end.
  else if iSk >= 100 and iSk <= 199 then do:
    if iSk mod 100 <= 19 then iZ = "ğimtas " + iki20(iSk mod 100).
    else iZ = "ğimtas " + desimtys(integer(truncate(iSk mod 100 / 10, 0))) + " " + iki20(iSk mod 10).
  end.
  else do:
      if iSk mod 100 <= 19 then iZ = iki20(integer(truncate(iSk / 100, 0))) + " ğimtai " + iki20(iSk mod 100).
      else iZ = iki20(integer(truncate(iSk / 100, 0))) + " ğimtai " + 
        desimtys(integer(truncate(iSk mod 100 / 10, 0))) + " " + iki20(iSk mod 10).
  end.

  return iZ.
end.

    // Funkcijø pabaiga


    // pagrindinë funkcija:


function numberToWords returns character (input dSk as decimal): 

define variable cZodis as character no-undo init "".
define variable iTrilijonai as integer no-undo init "0".
define variable iMilijardai as integer no-undo init "0".
define variable iMilijonai as integer no-undo init "0".
define variable iTukstanciai as integer no-undo init "0".
define variable iIkiTukst as integer no-undo init "0".
define variable iSkaicius as integer no-undo.
define variable dPoKablelio as decimal no-undo.
define variable cPirmaRaide as character no-undo.
define variable iDu as integer no-undo.
define variable cDuSk as character no-undo.


if dSk > 999999999999999 then
    cZodis = "Per didelis skaièius".


// ávestas skaièius iğskaidomas po tris skaitmenis (nnn,nnn,nnn)



if dSk < 0 then cZodis = "Minus ".
if dSk = 0 then cZodis = "Nulis".

iSkaicius = abs(truncate(dSk, 0)).
dPoKablelio = dSk - iSkaicius. //jeigu nesveikas skaièius, trupmeninë dalis bus pridëta skaièiais

iTrilijonai = integer(truncate(iSkaicius / 1000000000000, 0)).
iMilijardai = integer(truncate(iSkaicius mod 1000000000000 / 1000000000, 0)).
iMilijonai = integer(truncate(iSkaicius mod 1000000000 / 1000000, 0)).
iTukstanciai = integer(truncate(iSkaicius mod 1000000 / 1000, 0)).
iIkiTukst = iSkaicius mod 1000.


if iTrilijonai > 0 then do:
  if iTrilijonai mod 100 >= 10 and iTrilijonai mod 100 <= 19 then
    cZodis = cZodis + iki999(iTrilijonai) + " trilijonø ".
  else if iTrilijonai mod 10 = 1 then
    cZodis = cZodis + iki999(iTrilijonai) + " trilijonas ".
  else if iTrilijonai mod 10 = 0 then
    cZodis = cZodis + iki999(iTrilijonai) + " trilijonø ".
  else
    cZodis = cZodis + iki999(iTrilijonai) + " trilijonai ".
end.

if iMilijardai > 0 then do:
  if iMilijardai mod 100 >= 10 and iMilijardai mod 100 <= 19 then
    cZodis = cZodis + iki999(iMilijardai) + " milijardø ".
  else if iMilijardai mod 10 = 1 then
    cZodis = cZodis + iki999(iMilijardai) + " milijardas ".
  else if iMilijardai mod 10 = 0 then
    cZodis = cZodis + iki999(iMilijardai) + " milijardø ".
  else 
    cZodis = cZodis + iki999(iMilijardai) + " milijardai ".
end.


if iMilijonai > 0 then do:
  if iMilijonai mod 100 >= 10 and iMilijonai mod 100 <= 19 then
    cZodis = cZodis + iki999(iMilijonai) + " milijonø ".
  else if iMilijonai mod 10 = 1 then
    cZodis = cZodis + iki999(iMilijonai) + " milijonas ".
  else if iMilijonai mod 10 = 0 then
    cZodis = cZodis + iki999(iMilijonai) + " milijonø ".
  else 
    cZodis = cZodis + iki999(iMilijonai) + " milijonai ".
end.


if (iTukstanciai > 0) then do:
  if iTukstanciai mod 100 >= 10 and iTukstanciai mod 100 <= 19 then
    cZodis = cZodis + iki999(iTukstanciai) + " tûkstanèiø ".
  else if iTukstanciai mod 10 = 1 then
    cZodis = cZodis + iki999(iTukstanciai) + " tûkstantis ".
  else if iTukstanciai mod 10 = 0 then
    cZodis = cZodis + iki999(iTukstanciai) + " tûkstanèiø ".
  else 
    cZodis = cZodis + iki999(iTukstanciai) + " tûkstanèiai ".
end.

cZodis = cZodis + iki999(iIkiTukst).
cZodis = replace(cZodis, "  ", " "). //kai kur galëjo likti dvigubi tarpai, padaryti viengubus
cPirmaRaide = substring(cZodis, 1, 1).
cPirmaRaide = upper(cPirmaRaide).
cZodis = cPirmaRaide + substring(cZodis, 2, length(cZodis)).  //Pirma raidë didşioji

if dPoKablelio > 0 then do:    //dar pridedam trupmeninës dalies du skaièius po kablelio
  iDu = round(dPoKablelio * 100, 0).
  cDuSk = string(iDu).
  if iDu >= 10 and iDu <= 19 or iDu mod 10 = 0 then
    cZodis = cZodis + " " + cDuSk + " ğimtøjø".
  else if iDu mod 10 = 1 then
    cZodis = cZodis + " " + cDuSk + " ğimtoji".
  else 
    cZodis = cZodis + " " + cDuSk + "  ğimtosios".
end.

return cZodis.

end.


// funkcijos iğkvietimas

define variable dSkaicius as decimal format ">>>>>>>>>,>>" no-undo.
define variable cZodis as character no-undo.

update dSkaicius no-labels.
cZodis = numberToWords(dSkaicius).
message cZodis view-as alert-box.




