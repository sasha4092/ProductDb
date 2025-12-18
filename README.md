# PRODUCT Database Scripts

## Overview

This repository contains all database scripts for the **PRODUCT** schema, including:

- Table creation
- Package specifications and bodies
- Views
- Master/reference data inserts
- User creation
- Rollback scripts
- Test scripts

These scripts are intended for **development, testing, and deployment** in Oracle Database.

---

## Folder Structure
│                                                                                                                                                                        
├── 01_ddl/ # Tables,Views creation scripts                                                                                                                 
│ ├── tables/ 
│ ├── views/    
│                                                                                                                                                                        
├── 02_dml/ # Master/reference data inserts                                                                                                                              
│                                                                                                                                                                        
├── 03_packages/ # PL/SQL package specs and bodies                                                                                                                       
│ ├── spec/                                                                                                                                                              
│ └── body/                                                                                                                                                              
│                                                                                                                                                                        
├── 04_users/ # User privileges and roles                                                                                                                                
│                                                                                                                                                                        
├── 05_rollback/ # Drop/revert scripts for rollback                                                                                                                      
│                                                                                                                                                                        
└── 06_test/ # Test scripts for manual verification 

