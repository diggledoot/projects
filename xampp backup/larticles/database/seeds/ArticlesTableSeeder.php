<?php

use Illuminate\Database\Seeder;

class ArticlesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //https: //laravel.com/docs/7.x/seeding#introduction
        factory(App\Article::class, 30)->create();
    }
}
