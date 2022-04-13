package com.michelle.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.michelle.savetravels.models.Expense;
import com.michelle.savetravels.services.ExpenseService;

@Controller
public class ExpenseController {
	@Autowired
	private ExpenseService expenseService;


	@GetMapping("/expenses")
	public String expenses(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "HomeWithForm.jsp";
	}
	
	
	@PostMapping("/expenses")
	public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result,Model model) {
		if(result.hasErrors()) {
			List<Expense> expenses = expenseService.allExpenses();
			model.addAttribute("expenses",expenses);
			return"HomeWithForm.jsp";
		}else {
			expenseService.createExpense(expense);
			return "redirect:/books";
		}
	}
	
}
