import '../widgets/widgets.dart';

class BoardingScreenPage extends StatefulWidget {
  const BoardingScreenPage({Key? key}) : super(key: key);

  @override
  State<BoardingScreenPage> createState() => _BoardingScreenPageState();
}

class _BoardingScreenPageState extends State<BoardingScreenPage> {
  SvgPicture? svgIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BoardingScreenBloc>()..add(GetBoardingScreenData()),
      child: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: Colors.white,
        child: buildBody(context),
      ),
    );
  }

  BlocBuilder buildBody(BuildContext context) {
    return BlocBuilder<BoardingScreenBloc, BoardingScreenState>(
      builder: (context, state) {
        if (state is Empty) {
        } else if (state is Loading) {
        } else if (state is Loaded) {
          print("The state is ${state.model.items!.length}");
          return DisplayWalkthroughPage(showSliderModel: state.model);
        } else if (state is Error) {}
        return Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          color: Colors.white,
          child: svgIcon,
        );
      },
    );
  }
}
