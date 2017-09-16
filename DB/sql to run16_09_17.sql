ALTER TABLE rimDB.materials ADD CONSTRAINT materials_UN UNIQUE KEY (material_types_id,description) ;
ALTER TABLE rimDB.material_types ADD CONSTRAINT material_types_UN UNIQUE KEY (description) ;
