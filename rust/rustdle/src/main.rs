// A simple guessing game

use std::io;
use std::cmp::Ordering;
use rand::Rng;

fn main() {
    println!("Rustdle");

    // Set up game

    let rand_word_idx = rand::thread_rng()
        .gen_range(1..=max_num);
   
    // Loop until the player wins or quits
    loop {
        // Take in user input are parse it as an unsigned 32-bit int
        println!("Input your guess");
        let mut guess = String::new();
        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");
        let guess: u32 = match guess
            .trim()
            .parse() {
                Ok(num) => num,
                Err(_) => {
                    println!("That's not a number! \n");
                    continue;
                }
            };

        // Debugging
        println!("You guessed: {guess} \n");

        // Check the guess vs the answer
        match guess.cmp(&answer) {
            Ordering::Less => println!("Too low \n"),
            Ordering::Greater => println!("Too high \n"),
            Ordering::Equal => {
                println!("Correct!");
                break;
            }
        }
    }
}

