option_list() {    
    echo -e "\e[1;93m5.   \e[1;92mAPAGAR DADOS  (DESTRUTIVO)\e[0m"    
    echo -e "\e[1;93m6.   \e[1;92mAPAGAR LOGS DO RECOVERY (SEGURO)\e[0m"    
}    
    
case "$op" in    
  5)    
    read -p "TEM CERTEZA? (yes/no): " ok    
    if [ "$ok" = "yes" ]; then    
        adb shell rm -rf /sdcard/*    
    else    
        echo "Cancelado."    
    fi    
    ;;    
  6)    
    adb shell rm -rf /cache/recovery/    
    ;;    
esac  
wipe_sdcard() {  
    echo -e "\e[1;91m[AVISO EXTREMO]\e[0m Isso vai APAGAR TUDO da memória interna!"  
    read -p "Digite 'EU-SEI-O-QUE-ESTOU-FAZENDO' para continuar: " conf1  
    [ "$conf1" != "EU-SEI-O-QUE-ESTOU-FAZENDO" ] && echo "Cancelado." && return  
  
    echo  
    read -p "Última confirmação. Apagar mesmo? (yes/no): " conf2  
    [ "$conf2" != "yes" ] && echo "Cancelado." && return  
  
    echo -e "\nValidando dispositivo..."  
    adb get-state | grep -q "device" || { echo "Nenhum device! Cancelado."; return; }  
  
    echo "Verificando caminho..."  
    path="/sdcard"  
    [ "$path" != "/sdcard" ] && { echo "Caminho inválido! Abortado."; return; }  
  
    echo -e "\nIniciando apagamento em 5s..."  
    sleep 5  
  
    echo "Apagando..."  
    adb shell "rm -rf /sdcard/*"  
  
    echo -e "\e[1;92mConcluído com sucesso.\e[0m"  
}
