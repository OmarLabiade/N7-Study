with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Alea;

--------------------------------------------------------------------------------
--  Auteur   : Labiade Omar
--  Objectif : Jouer le jeu des 13 allumettes avec l’utilisateur
--------------------------------------------------------------------------------

procedure Allumettes is
	Niveau :Character;
	Tour_utilisateur : Boolean;
	Nombre_allumettes_restantes : Integer;
	Prise_utilisateur_valide : Boolean;
	Nombre_allumettes_a_retirer : Integer;
	Nombre_a_prendre : Integer;
	Reponse : Character;
	Prise_ordinateur_valide : Boolean;

	package Alea_1_3 is
		new Alea (1, 3);
	package Alea_1_2 is
		new Alea (1, 2);

begin
	--initialiser le jeu
	Put("Niveau de l'ordinateur (n)aïf, (d)istrait, (r)apide ou (e)xpert ? ");
	Get(Niveau);
	case Niveau is 	
		when 'n' | 'N'  => Put("Mon niveau est naif.");
		when 'd' | 'D'  => Put("Mon niveau est distrait.");
		when 'r' | 'R'  => Put("Mon niveau est rapide.");
		when others    => Put("Mon niveau est expert.");
	end case;
	New_Line;
	Put("Est-ce que vous commencez (o/n) ? ");
	Get(Reponse);
	New_Line;
	Tour_Utilisateur := (Reponse='o') or (Reponse='O');
	Nombre_allumettes_restantes := 13;
	while Nombre_allumettes_restantes > 0 loop
		--Afficher l'état du jeu
		--Afficher les allumettes restantes, avec un formatage en groupes de 5
		for i in 1..3 loop
			for j in 1..Nombre_allumettes_restantes loop
				if j mod 5 = 0 then --regroupement des allumettes par 5
					Put("|   "); --laisser 3 espaces
				else
					Put("| ");   --laisser 1 espace
				end if;	
			end loop;
			New_Line;
		end loop;
		if Tour_utilisateur then
			--Traiter la tour de l'utilisateur
			loop
				Put("Combien d'allumettes prenez-vous ? ");
				Get(Nombre_allumettes_a_retirer);
				if Nombre_allumettes_a_retirer <= 3 and Nombre_allumettes_a_retirer >= 1 then
					if Nombre_allumettes_restantes<Nombre_allumettes_a_retirer then
						if Nombre_allumettes_restantes = 1 then
							Put("Arbitre : Il reste une seule allumette.");
							Prise_utilisateur_valide := False;
						else --Nombre_allumettes_restantes = 2
							Put("Arbitre : Il reste seulement 2 allumettes.");
							Prise_utilisateur_valide := False;
						end if;
					else
						Nombre_allumettes_restantes := Nombre_allumettes_restantes-Nombre_allumettes_a_retirer;
						Prise_utilisateur_valide := True;
					end if;
				elsif Nombre_allumettes_a_retirer <= 0 then
					Put("Arbitre : Il faut prendre au moins une allumette.") ;
					Prise_utilisateur_valide := False;
				else
					Put("Arbitre : Il est interdit de prendre plus de 3 allumettes.") ;
					Prise_utilisateur_valide := False;
				end if;
				New_Line;
			exit when Prise_utilisateur_valide;
			end loop;
		else
			--Jouer un tour
			case Niveau is 	
				when 'n' | 'N' =>
					if Nombre_allumettes_restantes=1 then
						Nombre_a_prendre := 1;
						Nombre_allumettes_restantes := Nombre_allumettes_restantes-Nombre_a_prendre;
					elsif Nombre_allumettes_restantes=2 then
						Alea_1_2.Get_Random_Number(Nombre_a_prendre);
						Nombre_allumettes_restantes := Nombre_allumettes_restantes-Nombre_a_prendre;
					else
						Alea_1_3.Get_Random_Number(Nombre_a_prendre);
						Nombre_allumettes_restantes := Nombre_allumettes_restantes-Nombre_a_prendre;
					end if;
					if Nombre_a_prendre = 1 then  
						Put("Je prends une seule allumette.");
					else	
						Put("Je prends " & integer'image(Nombre_a_prendre) & " allumettes.");
					end if;
					New_Line;
				when 'd' | 'D' => 
					loop
						Alea_1_3.Get_Random_Number (Nombre_a_prendre);
						if Nombre_allumettes_restantes < Nombre_a_prendre then
							if Nombre_allumettes_restantes = 1 then
								Put("Je prends " & integer'image(Nombre_a_prendre) & " allumettes.");
								New_Line;
								Put("Arbitre : Il reste une seule allumette.");
								Prise_ordinateur_valide := False;
							else --Nombre_allumettes_restantes = 2
								Put("Je prends " & integer'image(Nombre_a_prendre) & " allumettes.");
								New_Line;
								Put("Arbitre : Il reste seulement 2 allumettes.");
								Prise_ordinateur_valide := False;
							end if;
						else
							if Nombre_a_prendre = 1 then  
								Put("Je prends une seule allumette.");
							else	
								Put("Je prends " & integer'image(Nombre_a_prendre) & " allumettes.");
							end if;
							Prise_ordinateur_valide := True;
						end if;
						New_Line;
					exit when Prise_ordinateur_valide;
					end loop;
					Nombre_allumettes_restantes := Nombre_allumettes_restantes-Nombre_a_prendre;
				when 'r' | 'R' =>
					if Nombre_allumettes_restantes <= 3 and Nombre_allumettes_restantes >= 1 then
						Nombre_a_prendre := Nombre_allumettes_restantes;
						Nombre_allumettes_restantes := Nombre_allumettes_restantes-Nombre_a_prendre;
					else
						Nombre_a_prendre := 3;
						Nombre_allumettes_restantes := Nombre_allumettes_restantes-Nombre_a_prendre;
					end if;
					if Nombre_a_prendre = 1 then  
						Put("Je prends une seule allumette.");
					else	
						Put("Je prends " & integer'image(Nombre_a_prendre) & " allumettes.");
					end if;
					New_Line;
				when others    =>
					if Nombre_allumettes_restantes mod 4 = 1 then
						if Nombre_allumettes_restantes >= 3 then
							Alea_1_3.Get_Random_Number(Nombre_a_prendre);
						elsif Nombre_allumettes_restantes=2 then
							Alea_1_2.Get_Random_Number(Nombre_a_prendre);
						else
							Nombre_a_prendre := 1;
						end if;
						Nombre_allumettes_restantes := Nombre_allumettes_restantes-Nombre_a_prendre;
					elsif Nombre_allumettes_restantes mod 4 = 0 then
						Nombre_a_prendre := 3;
						Nombre_allumettes_restantes := Nombre_allumettes_restantes-Nombre_a_prendre;
					elsif Nombre_allumettes_restantes mod 4 = 2 then
						Nombre_a_prendre := 1;
						Nombre_allumettes_restantes := Nombre_allumettes_restantes-Nombre_a_prendre;
					else
						Nombre_a_prendre := 2;
						Nombre_allumettes_restantes := Nombre_allumettes_restantes-Nombre_a_prendre;
					end if;
					if Nombre_a_prendre = 1 then  
						Put("Je prends une seule allumette.");
					else	
						Put("Je prends " & integer'image(Nombre_a_prendre) & " allumettes.");
					end if;
					New_Line;
			end case;
		end if;
		Tour_utilisateur := not Tour_utilisateur;
	end loop;
	-- afficher le gangant
	if Tour_utilisateur then
		Put("Vous avez gagné.");
		New_Line;
	else
		Put("J'ai gagné.");
		New_Line;
	end if;

end Allumettes; 
