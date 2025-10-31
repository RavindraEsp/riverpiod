import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/state_provider/slide_provider.dart';

final counterProvider = StateProvider<int>((ref) {
  return 0;
});


final switchProvider = StateProvider<bool>((ref) {
  return false;
});
class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(switchProvider.notifier).state = true;
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    // final counter = ref.watch(counterProvider);


    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final counter1 = ref.watch(counterProvider);

              print("build 1");

              return Text(counter1.toString());
            },
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                child: Text("-"),
              ),

              // Text(counter.toString()),
              ElevatedButton(onPressed: () {

                ref.read(counterProvider.notifier).state--;
              }, child: Text("+")),
            ],
          ),

          Consumer(builder: (context,ref,child){

            final switchV = ref.watch(switchProvider);

            print("build 2");
            return Switch(value: switchV, onChanged: (v){


              ref.read(switchProvider.notifier).state = v;
            });
          }),




          Consumer(builder: (context,ref,child){

            final slider = ref.watch(slideProvider);

            print("build 3");
            return  Column(
              children: [

                Container(
                  height: 50,
                  width: 50,
                  color: Colors.red.withValues(alpha: slider),
                ),


                Slider(value: slider, onChanged: (v){


                  ref.read(slideProvider.notifier).state = v;
                }),
              ],
            );
          }),





        ],
      ),
    );
  }
}
