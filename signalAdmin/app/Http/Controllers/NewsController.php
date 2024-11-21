<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\News;
use Exception;
use Illuminate\Support\Facades\Log;

class NewsController extends Controller
{
    public function index()
    {
        $news = News::get();

        return view('news.list', ['news' => $news]);
    }


    public function create(News $news)
    {
        return view('news.add', [
            'news' => $news
        ]);
    }


    public function store(Request $request)
    {
        $news = new News();
        $news->header = $request->get('header');
        $news->description = $request->get('description') ?? '';


        try {
            if ($news->save()) {

                return back()->with('success', 'Added Successfully');
            }
            return back()->with('error', 'Not Added');
        } catch (Exception $ex) {
            Log::error($ex);
            return back()->with('error', 'Not Added');
        }
    }


    public function show(News $news)
    {
        return view('news.single')->with('news', $news);
    }

    public function edit(News $news)
    {

        return view('news.edit', [
            'news' => $news
        ]);
    }



    public function update(Request $request, News $news)
    {

        try {


            $news->update([
                $news->header = $request->get('header'),

                $news->description = $request->get('description') ?? '',
            ]);

            return back()->with('success', 'Updated Successfully');
        } catch (Exception $ex) {
            Log::error($ex);
            return back()->with('error', 'Not Updated');
        }
    }


    public function destroy(News $news)
    {
        try {
            $news->delete();
            return back()->with('success', 'Deleted Successfully');
        } catch (Exception $ex) {
            Log::error($ex);
            return redirect()->back()->with('error', 'Not Deleted ');
        }
    }


    public function api(Request $request)
    {
        $trades =  News::get();

        return $trades;
    }

}
