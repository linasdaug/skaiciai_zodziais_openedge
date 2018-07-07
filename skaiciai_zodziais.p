function iki20 returns character (input iSk as integer): 
 case iSk: 
   when 1 then return "vienas".
   when 2 then return "du".
   when 3 then return "trys".
   when 4 then return "keturi".
   when 5 then return "penki".
   when 6 then return "�e�i".
   when 7 then return "septyni".
   when 8 then return "a�tuoni".
   when 9 then return "devyni".
   when 10 then return "de�imt".
   when 11 then return "vienuolika".
   when 12 then return "dvylika".
   when 13 then return "trylika".
   when 14 then return "keturiolika".
   when 15 then return "penkiolika".
   when 16 then return "�e�iolika".
   when 17 then return "septyniolika".
   when 18 then return "a�tuoniolika".
   when 19 then return "devyniolika".
   otherwise return "".
 end.
end.

function desimtys returns character (input iSk as integer): 
 case iSk: 
   when 2 then return "dvide�imt".
   when 3 then return "trisde�imt".
   when 4 then return "keturiasde�imt".
   when 5 then return "penkiasde�imt".
   when 6 then return "�e�iasde�imt".
   when 7 then return "septyniasde�imt".
   when 8 then return "a�tuoniasde�imt".
   when 9 then return "devyniasde�imt".
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
    if iSk mod 100 <= 19 then iZ = "�imtas " + iki20(iSk mod 100).
    else iZ = "�imtas " + desimtys(integer(truncate(iSk mod 100 / 10, 0))) + " " + iki20(iSk mod 10).
  end.
  else do:
      if iSk mod 100 <= 19 then iZ = iki20(integer(truncate(iSk / 100, 0))) + " �imtai " + iki20(iSk mod 100).
      else iZ = iki20(integer(truncate(iSk / 100, 0))) + " �imtai " + 
        desimtys(integer(truncate(iSk mod 100 / 10, 0))) + " " + iki20(iSk mod 10).
  end.

  return iZ.
end.

    // Funkcij� pabaiga


    // pagrindin� funkcija:


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
    cZodis = "Per didelis skai�ius".


// �vestas skai�ius i�skaidomas po tris skaitmenis (nnn,nnn,nnn)



if dSk < 0 then cZodis = "Minus ".
if dSk = 0 then cZodis = "Nulis".

iSkaicius = abs(truncate(dSk, 0)).
dPoKablelio = dSk - iSkaicius. //jeigu nesveikas skai�ius, trupmenin� dalis bus prid�ta skai�iais

iTrilijonai = integer(truncate(iSkaicius / 1000000000000, 0)).
iMilijardai = integer(truncate(iSkaicius mod 1000000000000 / 1000000000, 0)).
iMilijonai = integer(truncate(iSkaicius mod 1000000000 / 1000000, 0)).
iTukstanciai = integer(truncate(iSkaicius mod 1000000 / 1000, 0)).
iIkiTukst = iSkaicius mod 1000.


if iTrilijonai > 0 then do:
  if iTrilijonai mod 100 >= 10 and iTrilijonai mod 100 <= 19 then
    cZodis = cZodis + iki999(iTrilijonai) + " trilijon� ".
  else if iTrilijonai mod 10 = 1 then
    cZodis = cZodis + iki999(iTrilijonai) + " trilijonas ".
  else if iTrilijonai mod 10 = 0 then
    cZodis = cZodis + iki999(iTrilijonai) + " trilijon� ".
  else
    cZodis = cZodis + iki999(iTrilijonai) + " trilijonai ".
end.

if iMilijardai > 0 then do:
  if iMilijardai mod 100 >= 10 and iMilijardai mod 100 <= 19 then
    cZodis = cZodis + iki999(iMilijardai) + " milijard� ".
  else if iMilijardai mod 10 = 1 then
    cZodis = cZodis + iki999(iMilijardai) + " milijardas ".
  else if iMilijardai mod 10 = 0 then
    cZodis = cZodis + iki999(iMilijardai) + " milijard� ".
  else 
    cZodis = cZodis + iki999(iMilijardai) + " milijardai ".
end.


if iMilijonai > 0 then do:
  if iMilijonai mod 100 >= 10 and iMilijonai mod 100 <= 19 then
    cZodis = cZodis + iki999(iMilijonai) + " milijon� ".
  else if iMilijonai mod 10 = 1 then
    cZodis = cZodis + iki999(iMilijonai) + " milijonas ".
  else if iMilijonai mod 10 = 0 then
    cZodis = cZodis + iki999(iMilijonai) + " milijon� ".
  else 
    cZodis = cZodis + iki999(iMilijonai) + " milijonai ".
end.


if (iTukstanciai > 0) then do:
  if iTukstanciai mod 100 >= 10 and iTukstanciai mod 100 <= 19 then
    cZodis = cZodis + iki999(iTukstanciai) + " t�kstan�i� ".
  else if iTukstanciai mod 10 = 1 then
    cZodis = cZodis + iki999(iTukstanciai) + " t�kstantis ".
  else if iTukstanciai mod 10 = 0 then
    cZodis = cZodis + iki999(iTukstanciai) + " t�kstan�i� ".
  else 
    cZodis = cZodis + iki999(iTukstanciai) + " t�kstan�iai ".
end.

cZodis = cZodis + iki999(iIkiTukst).
cZodis = replace(cZodis, "  ", " "). //kai kur gal�jo likti dvigubi tarpai, padaryti viengubus
cPirmaRaide = substring(cZodis, 1, 1).
cPirmaRaide = upper(cPirmaRaide).
cZodis = cPirmaRaide + substring(cZodis, 2, length(cZodis)).  //Pirma raid� did�ioji

if dPoKablelio > 0 then do:    //dar pridedam trupmenin�s dalies du skai�ius po kablelio
  iDu = round(dPoKablelio * 100, 0).
  cDuSk = string(iDu).
  if iDu >= 10 and iDu <= 19 or iDu mod 10 = 0 then
    cZodis = cZodis + " " + cDuSk + " �imt�j�".
  else if iDu mod 10 = 1 then
    cZodis = cZodis + " " + cDuSk + " �imtoji".
  else 
    cZodis = cZodis + " " + cDuSk + "  �imtosios".
end.

return cZodis.

end.


// funkcijos i�kvietimas

define variable dSkaicius as decimal format ">>>>>>>>>,>>" no-undo.
define variable cZodis as character no-undo.

update dSkaicius no-labels.
cZodis = numberToWords(dSkaicius).
message cZodis view-as alert-box.




