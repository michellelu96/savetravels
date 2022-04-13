package com.michelle.savetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.michelle.savetravels.models.Expense;

public interface ExpenseRepository extends CrudRepository<Expense, Long>{
	List<Expense> findAll();
	
	List<Expense> findByName(String search);
	
	Long countByNameContaining(String search);
	
	Long deleteByNameStartingWith(String search);
}
