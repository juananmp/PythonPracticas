#!/bin/bash
#Comprueba que el usuario que ejecuta el script es root
if ! [ $(id -u) = 0 ];
  then
  printf "No eres Root, no puedes continuar..."
  exit 1

else
  #Array de los administradores
  admins=( jose raul alberto juanan guille )
  #Pregunta si quieres crear los usuarios o generar las claves publica y privada
  read -p "¿Qué acción quieres realizar? (1.Crear usuarios, 2.Generar claves)" opcion
  if [ $opcion = "1" ] then
      read -p "¿Qué puerto quieres utilizar para SSH? (1024-65500)" numero
      sed "s/22/$numero/g" /home/$user/ssh/sshd_config
      #Bucle que va recorriendo todos los admins del array
      for user  in "${admins[@]}"
        doS
            #Añade el usuario, con su home, contraseña GonetFPI999,
            #le da persmisos de sudo, guarda su clave publica en el fichero
            useradd -m -p pa3GrE2eHuydo -s /bin/bash "$user"
            printf "$user ALL=(ALL:ALL) ALL" >> /etc/sudoers
            case $user in
              jose)
                printf ' ' > /home/jose/authentication_keys
              ;;
              raul)
                printf ' ' > /home/raul/authentication_keys
              ;;
              guille)
                printf ' ' > /home/guille/authentication_keys
              ;;
              alberto)
                printf ' ' > /home/alberto/authentication_keys
              ;;
              juanan)
                printf ' ' > /home/juanan/authentication_keys
              ;;
            esac
            printf "Usuario $user añadido."
        done
    printf "Usuarios añadidos correctamente."
  if [ $opcion = "2" ] then
    #Bucle que recorre todas las claves del Array
    for user in  "${claves[@]}"
      do
        #Genera las claves publica y privada
        ssh-keygen -f /home/$user/.ssh/clave -t ed2559
        sed "s/root/$user/g" /home/$user/.ssh/clave.pub
        #Guarda la Clave publica de cada usuario en su variable correspondiente
        case $user in
          jose)
            clavejose=$(cat /home/jose/.ssh/clave.pub)
          ;;
          raul)
            claveraul=$(cat /home/raul/.ssh/clave.pub)
          ;;
          guille)
            claveguille=$(cat /home/guille/.ssh/clave.pub)
          ;;
          alberto)
            clavealberto=$(cat /home/jose/.ssh/clave.pub)
          ;;
          juanan)
            clavejuanan=$(cat /home/juanan/.ssh/clave.pub)
          ;;
      esac
      printf "#Clave de Juanan: $clavejuanan" >> despliegue_maquinas.sh
      printf "#Clave de Alberto: $clavealberto" >> despliegue_maquinas.sh
      printf "#Clave de Raul: $claveraul" >> despliegue_maquinas.sh
      printf "#Clave de Jose: $clavejose" >> despliegue_maquinas.sh
      printf "#Clave de Guille: $claveguille" >> despliegue_maquinas.sh
    done
  fi
fi