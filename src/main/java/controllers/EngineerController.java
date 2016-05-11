package controllers;

import java.util.List;

import model.Engineer;

public interface EngineerController {

	Engineer getEngineer(String id);

	List<Engineer> getAllEngineers();

}