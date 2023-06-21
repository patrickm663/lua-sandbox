// A simple CLI Wordle clone

use std::io;
use std::fs::read_to_string;
use rand::Rng;

fn main() {
    println!("Welcome to Rustdle");

    // Set up game
    let rustdle_length: usize = 5;
    let game_length: u8 = 5;
    let answer = generate_answer(rustdle_length);
    let mut guess_count: u8 = 0;
    let mut is_won: bool = false;
    
    // Debugging
    println!("{}", answer);
   
    // Loop until the player wins or quits
    loop {
        let guess = String::new();
        println!("Input your guess");
        // Take in user input as a string
        let guess = get_guess(guess, rustdle_length);

        guess_count = guess_count + 1;

        // Debugging
        println!("You guessed: {guess} \n");
        println!("Guess count: {guess_count} \n");

        // Check the guess vs the answer
        is_won = check_guess(guess, answer.clone());
        if is_won == true {
            println!("You win!\n Guesses: {guess_count}");
            break;
        }
        if guess_count == game_length {
            println!("Game Over!\n The word was: {answer}");
            break;
        }
    }
}

fn generate_answer(word_length: usize) -> String {
    let mut word_list = Vec::new();
    for line in read_to_string("data/word_list.txt").unwrap().lines() {
        if line.trim().to_string().len() == word_length {
            word_list.push(line.to_string());
        }
    }
    let random_choice = rand::thread_rng()
        .gen_range(0..=word_list.len());
    let answer = &word_list[random_choice];
    println!("{}", answer);
    return answer.to_string();
}

fn get_guess(mut guess: String, r_length: usize) -> String {
    loop {
        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");

        if (guess.len()-1) == r_length {
            break;
        } else {
            println!("Invalid entry. Please retry");
            guess.clear();
        }
    }
    return guess.trim().to_string();
}

fn check_guess(guess: String, answer: String) -> bool {
    return guess == answer;
}
