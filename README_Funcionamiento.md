Target:
AYACUCHO_2014_target_completo

Inputs:
Todo parte de giro_jicamarca_data_procesado: Time_UTC,Time_Local_Peru,CS,foF2,hF,hmF2,B0

calcular_inputs_1_ventana_extremos.py: 
* giro_jicamarca_data_procesado_inputs_1ventana_validado.csv: FECHA,Mh_PRECURSOR,Mv_PRECURSOR,Dh_TOTAL,F_DENSITY,Delta_foF2_1,slope_foF2_1,foF2_max_SW,foF2_min_SW,foF2_drop_SW,num_muestras_foF2,delta_inicio_min,delta_fin_min,extremos_validos,hora_inicio_real,hora_fin_real,tiempo_real_min,num_registros
calcular_inputs_2ventanas_extremos.py: 
* giro_jicamarca_data_procesado_inputs_2ventanas_validado.csv: FECHA,Δh1,Mh1,Mv1,Delta_foF2_1,slope_foF2_1,foF2_max_SW1,foF2_min_SW1,foF2_drop_SW1,num_muestras_foF2_SW1,delta_inicio_SW1_min,delta_fin_SW1_min,extremos_validos_SW1,tiempo_real_SW1_min,Δh2,Mh2,Mv2,Delta_foF2_2,slope_foF2_2,foF2_max_SW2,foF2_min_SW2,foF2_drop_SW2,num_muestras_foF2_SW2,delta_inicio_SW2_min,delta_fin_SW2_min,extremos_validos_SW2,tiempo_real_SW2_min,F_DENSITY
calcular_inputs_3ventanas_extremos.py: 
* giro_jicamarca_data_procesado_inputs_3ventanas_validado.csv: FECHA,Δh1,Mh1,Mv1,Delta_foF2_1,slope_foF2_1,foF2_max_SW1,foF2_min_SW1,foF2_drop_SW1,num_muestras_foF2_SW1,delta_inicio_SW1_min,delta_fin_SW1_min,extremos_validos_SW1,tiempo_real_SW1_min,Δh2,Mh2,Mv2,Delta_foF2_2,slope_foF2_2,foF2_max_SW2,foF2_min_SW2,foF2_drop_SW2,num_muestras_foF2_SW2,delta_inicio_SW2_min,delta_fin_SW2_min,extremos_validos_SW2,tiempo_real_SW2_min,Δh3,Mh3,Mv3,Delta_foF2_3,slope_foF2_3,foF2_max_SW3,foF2_min_SW3,foF2_drop_SW3,num_muestras_foF2_SW3,delta_inicio_SW3_min,delta_fin_SW3_min,extremos_validos_SW3,tiempo_real_SW3_min,F_DENSITY

Inputs - OMNI2:
* omni2.py: 
	# Nombre del archivo de entrada (ASCII)
	input_file = "omni2_A5YiH_h88y.lst.txt"

	# Nombre del archivo de salida (CSV)
	output_file = "omni2_2014_EFM_UTC_Peru.csv"
	
* omni2_dataset.py
	input_file = "omni2_2014_EFM_UTC_Peru.csv"
	output_file = "omni2_2014_EFM_UTC_Peru_features_omni2.csv": FECHA,Bz_mean_16_19,Bz_min_16_19,Bz_slope_16_19,E_mean_16_19,E_max_16_19,E_slope_16_19,SW_speed_mean_16_19,SW_speed_std_16_19,SW_speed_slope_16_19,Dst_mean_16_19,Dst_min_16_19,Pdyn_mean_16_19,Pdyn_max_16_19,BY_mean_16_19,Kp_last_6h_mean,Kp_last_6h_max,Kp_last_6h_sum,F10.7_Index,num_registros_16_19,num_registros_kp_13_18

Fusion Inputs + OMNI2:
* fusion_final_inputs_omni2.py: 
    archivo_ionosfera = "giro_jicamarca_data_procesado_inputs_3ventanas_validado.csv"
    archivo_omni2 = "omni2_2014_EFM_UTC_Peru_features_omni2.csv"
	
Fusion Inputs + Targets:
* fusion_final_INPUTS_TARGETS.py
    archivo_inputs = "giro_jicamarca_data_procesado_inputs_3ventanas_validado_con_omni2.csv"
    archivo_targets = "AYACUCHO_2014_target_completo.csv"