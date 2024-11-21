<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Contact>
 */
class ContactFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'about' => fake()->name(),
            'name' => fake()->name(),
            'telegram' => 'www.com',
            'address' => fake()->address(),
            'phone' => fake()->phoneNumber(),
            'email' => 'system@gmail.com'
        ];
    }
}
