# functions.py
#=================================================================================================#
# Reusable helper functions for the project:
# hospital_service_analysis_2025-2026 - Data Science Portafolio
# By:
# Juan L. Alva
#=================================================================================================#

import pandas as pd

#=================================================================================================#


def age_range(age):
    """
    Función para categorizar las edades en años en una década que se está viviendo
    - '10s' para 18 <= age < 20
    - '20s' para 20 <= age < 30
    - '30s' para 30 <= age < 40
    - '40s' para 40 <= age < 50
    - '50s' para 50 <= age < 60
    - '60s' para 60 <= age < 70
    - '70s' para 70 <= age < 80
    - '80s' para 80 <= age < 90
    - '90s' para 90 <= age < 100
    - '100s' para age >= 100
    """

    if age < 20:
        return '10s'
    elif age < 30:
        return '20s'
    elif age < 40:
        return '30s'
    elif age < 50:
        return '40s'
    elif age < 60:
        return '50s'
    elif age < 70:
        return '60s'
    elif age < 80:
        return '70s'
    elif age < 90:
        return '80s'
    elif age < 100:
        return '90s'
    else:
        return '100s'
    

#=================================================================================================#


def sort_age_range(age_range):
    """
    Función para crear una columna auxiliar que asigne un número según el rango de edad
    - '10s' = 1
    - '20s' = 2
    - '39s' = 3
    - '40s' = 4
    - '50s' = 5
    - '60s' = 6
    - '70s' = 7
    - '80s' = 8
    - '90s' = 9
    - '100a' = 10
    """

    if age_range == '10s':
        return 1
    elif age_range == '20s':
        return 2
    elif age_range == '30s':
        return 3
    elif age_range == '40s':
        return 4
    elif age_range == '50s':
        return 5
    elif age_range == '60s':
        return 6
    elif age_range == '70s':
        return 7
    elif age_range == '80s':
        return 8
    elif age_range == '90s':
        return 9
    else:
        return 10
    
#=================================================================================================#


def sort_schooling(schooling):
    """
    Función para ordenar la escolaridad de forma cronológica
    - Analfabeta = 1
    - Primaria = 2
    - Secundaria = 3 
    - Preparatoria = 4
    - Licenciatura = 5
    - Maestría = 6
    - Doctorado = 7
    """

    if schooling == 'Analfabeta':
        return 1
    elif schooling == 'Primaria':
        return 2
    elif schooling == 'Secundaria':
        return 3
    elif schooling == 'Preparatoria':
        return 4
    elif schooling == 'Licenciatura':
        return 5
    elif schooling == 'Maestría':
        return 6
    else:
        return 7
        

#=================================================================================================#