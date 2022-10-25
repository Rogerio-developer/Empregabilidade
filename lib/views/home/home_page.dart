import 'package:carousel_slider/carousel_slider.dart';
import 'package:empregabildade/components/animations/info_widget.dart';
import 'package:empregabildade/components/safe_area/safe_area_widget.dart';
import 'package:empregabildade/repository/images.dart';
import 'package:empregabildade/views/about/about_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> list = imagens_course;
  List<String> listInfo = [
    'images/info1.png',
    'images/info2.png',
    'images/info3.png'
  ];
  int indexPage = 0;

  @override
  void initState() {
    list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea21(
      titulo: 'EMPREGABILIDADE',
      icon: const Tooltip(
        message: 'Informações sobre o app',
        child: InfoWidget(),
      ),
      iconSize: 80,
      page: const AboutPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 300,
                  child: CarouselSlider.builder(
                    itemCount: listInfo.length,
                    itemBuilder: (context, index, realIndex) {
                      return Card(
                        color: const Color.fromRGBO(59, 57, 138, 1),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          listInfo[index],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        setState(() => indexPage = index);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: buildIndex(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'O Programa Entra21 nasceu da necessidade de formação e reposição de mão-de-obra para o setor de tecnologia do Vale do Itajaí, '
                'representado pelo Blusoft - Polo de Tecnologia da Informação e Comunicação da Região de Blumenau.'
                'Desde 2006 já beneficiou e encaminhou mais de 5.000 jovens para empregos de qualidade.'
                ' Sendo financiado pelo governo do estado através da FAPESC, Prefeitura de Blumenau e empresas de Blumenau e região.'
                'E em 2022, o Programa expande para todos os cantos de Santa Catarina,'
                ' com a missão de levar a formação de qualidade para milhares de pessoas do estado.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              child: Image.asset('images/mapa.png'),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              child: Image.asset('images/investidores.png'),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              child: Image.asset('images/ancoras.png'),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              child: Image.asset('images/empresas_apoio.png'),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              child: Image.asset('images/municipios.png'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndex() => AnimatedSmoothIndicator(
        activeIndex: indexPage,
        count: listInfo.length,
        effect: const SlideEffect(
          activeDotColor: Color.fromRGBO(59, 57, 138, 1),
          dotColor: Colors.white,
        ),
      );
}
