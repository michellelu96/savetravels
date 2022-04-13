package com.michelle.savetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.michelle.savetravels.models.Expense;
import com.michelle.savetravels.services.ExpenseService;

@RestController
public class ExpenseApi {
	
	@Autowired
	private ExpenseService expenseService;
	
	public ExpenseApi(ExpenseService expenseService) {
		this.expenseService = expenseService;
	}
	
	// get all expenses
	@GetMapping("/api/expenses")
	public List<Expense> findAllExpenses(){
		return expenseService.allExpenses();
	}
	
	//find one
	@GetMapping("/api/expenses/{id}")
	public Expense oneExpense(@PathVariable("id") Long id) {
		return expenseService.findExpense(id);
	}
	
	//create one
	@PostMapping("/api/expenses")
	public Expense createExpense(@RequestParam("name") String name, @RequestParam("vendor") String vendor, @RequestParam("description") String description, @RequestParam("amount") Double amount) {
		Expense newExpense = new Expense(name,vendor,description,amount);
		return expenseService.createExpense(newExpense);
	}
	
	//update one 
	@PutMapping("/api/expenses/{id}")
	public Expense updateExpense(@PathVariable("id") Long id, 
			@RequestParam("name") String name, 
			@RequestParam("vendor") String vendor,
			@RequestParam("description") String description,
			@RequestParam("amount") Double amount) {
		Expense updateExpense = expenseService.findExpense(id);
		updateExpense.setName(name);
		updateExpense.setVendor(vendor);
		updateExpense.setDescription(description);
		updateExpense.setAmount(amount);
		return expenseService.updateExpense(updateExpense);
	}
	
	//delete
	@DeleteMapping("/api/expenses/{id}")
	public void deleteExpense(@PathVariable("id") Long id) {
		expenseService.deleteExpense(id);
	}
}
