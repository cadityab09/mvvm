import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeViewModel homeViewModel=HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.fetchMoviesListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          InkWell(
          onTap: (){
            userViewModel.removeUser().then((value){
              Navigator.pushNamed(context, RouteNames.login);
            }).onError((error,stackTrace){
              Utils.showFlushMessage(error.toString(), context);
            });

          },
          child: Text('Logout')),
          SizedBox(width: 20,),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (_) => homeViewModel,
        child: Consumer<HomeViewModel>(builder: (context,value, child){
          switch(value.moviesList.status){
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.moviesList.msg.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.moviesList.data!.movies!.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        leading:Image.network(value.moviesList.data!.movies![index].posterurl.toString(),
                          errorBuilder: (context,error, stack){
                            return Icon(Icons.error,color: Colors.red,size: 40,);
                          },
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(value.moviesList.data!.movies![index].title.toString()),
                        subtitle: Text(value.moviesList.data!.movies![index].year.toString()),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(Utils.calculateAvgRating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),
                            Icon(Icons.star, color: Colors.yellow,)
                          ],
                        ),
                      ),
                    );
                  });
            case null:
              return Text('null');
          }
          return Container();

        }),
      ),
    );
  }
}
