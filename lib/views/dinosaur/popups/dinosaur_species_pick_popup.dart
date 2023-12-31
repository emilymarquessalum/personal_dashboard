



import 'package:flexible_structures/widgets/graphical_item/graphical_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_dashboard/views/dinosaur/models/dinosaur_species.dart';
import 'package:personal_dashboard/views/dinosaur/view/dinosaur_species_card.dart';

class DinosaurSpeciesPickPopup extends StatelessWidget {
  const DinosaurSpeciesPickPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[


        for(DinosaurSpecies species in [
          DinosaurSpecies(
            speciesName: 'Tyrannosaurus Rex',
            image: GraphicalItem(
                item: Image.network("https://static.vecteezy.com/system/resources/previews/017/319/540/original/cute-blue-tyrannosaurus-cartoon-icon-illustration-animal-dinosaurs-icon-concept-isolated-premium-flat-cartoon-style-vector.jpg"), type: Graphical.image

            ),
          ),
          DinosaurSpecies(
            speciesName: 'Triceratops',
            image:

              GraphicalItem(
                type: Graphical.image,
                item: Image.network("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAABX1BMVEWWykJNoEYAAAD///88eDpPpEiZzkM8dzo+fDxQpkmb0UROokZMnkVInkFLn0SXzEK8vLzGxsZKmkNBhjv19fVGkEE8fTdIlUFEjj7j4+M3bjWUx0Hs7OzJycmKuj0pUyjY2Nhqjy8qVyZdqFYzZzETJRKDsDp8pzePwD+Xl5etra1AVh11njRBiDuLi4sjSCAZMhgcORoIEAgrOhQMGAympqZzc3NprmEfQBwaNRhDQ0MPHQ40bC8lSyJSbyWo0p45TRomMxIZGRk3NzeNrYWbvZJ6uHEqKipeXl4pMieOxIVGXiB9fX1khyxvljIAHgAMAA1beilSUlJ0jm4aIw1CUT5shWWLwoIvXi5NZyM0RhgyPC8jKCGYxY9dnlZPikhPdEk1SDIOLwkpIClXbFIjGiQKNgMAJgBzq2tgkVkAGwAbSBZPbUpIWUWMt4N7nnVfclojNgAaChsXJgAQABw2KXmcAAAWY0lEQVR4nO1di1faWtaXTRISTjSYSIJPFIOiFXmIFgWkaq32oaPWttTW+ea2vfPqdDpz7/z/69v7JAiEYB/3jqGz8lsz61ZA1/mx99nvczIyEiJEiBAhQoQIESJEiBAhQoQIESJEiBAhQoQIESJEiBAhQoQI8UNBkzh833Pe0u54Rb8vNGn59SXA1YJLUXPB/z1ysgFw+XrZn/6PAS33ABxcadJ0LpebW1peXl6am8vlprXcHr6+j/+/N/3jinF6D/ZX5icnE0dwdW+vAh2U9x5swMH45Mz8yj7s/bAM47twMBMlzDq0Hr95QXjz+O0Z/ey8N3kEJz+mompSfA8SnEQ0AW8fHh4eXl8/efLq1aNH9//4xz/+XwUSkxP05ipcxX9AKUrxuRPcaCvj47Ozs6v78KdH9xcXI2xsdHR0jMCUNByt8nfXAZ4ux38wmyrFTzecDfdsc3XlGKDIOLFIF3Tcl8crmytb/HN7CwNcylBCmj6nRX/63PzJNSwFxiJeML3qvpu2MvSfk5EfRI7S9Aku9/Hz5vWjiCKXarViJqX0E0SKipEpZrMNQ2GKWs+iJVoY+QHkqEmn6OLfPGw+WcQdFxEVhOjHj3PkbzP+L2YWATaG3/1LuXvI73Pz1eLo2ABag8CYUAN4PT3UHLX4GpqP5yS/b+VHEHXcj5fL8aBpDACG2JqEFubNYfP+d/EjMYp53I7n5B2Hz+bElxYWllBDXzafRL6TH4eaRu8Yl3LakAUBNyH2w+aj7xWgK0ZFQE2lWH15mDhqc7j9traI4OLob+FHUFJuzvF6mGzOBuxgiPkM/vHbCWIkADAfnVnBtGpoKEoncEQx9CZklN9MMMLysEMB+TwMTc6hTW/AOK1pHWzxd2Cow/6Ek5BcTgfNzYE2B/u0ookjyA+KXr7EqvsHJQvrPOc6gOXhMDbaEuzMzkzMbEHx+/iJltEte2YArM/Oz88fw+lwqCky3E+Mj6MpNb5LSRWZko9uxi3Mq1ZnE/tDI0Mypc+OAOqDY+xbwCxYmYdU928qtuNdN7QhYThXpuVUTOMv775diizyh4voJBi9WzFfpb85LJmG9BQ+PW+ZqgXPjsH4Vn8hZmAiOn9m9n41mDEmG/BgOBjiNoTDJ6Iomu+jM99MURRgNhqdfV/3Cp+J6PmHYx+iCD80FzHZNX+eiI5/I0UxDyvoF8Z3Mv3qrTSGI6pBb4giHKVY5GwmOpk4BvMbKOrlLe7cLz72/xJDGzs3BEKUduETiTASScEkSmP8WyiK73i4N+HPMF/EXDFofsgQM4onPN62iOFMAh2j0LtchpvqBu34hV5SMvQr+EvjfgwjyRZsBJ8Ka2vwuHmfRIh+bZYC5sT4M6iL7fIhYyJTdbNuZ9KNRjpjCyldpbdEXWjZGf4b+DsDGMbKQ6Cm8aeY1jtc1Moq71EkxtchE1EjIieSz5QAyrXsdrWQRjQKBRujV1HYztRLsOkU/Wd9GTJL2B6C9CKOSvrKSQrFP/OAeWI8Mb4C2WIpY6GgMhnByFuq4kLE/2Hgw0xBUXR4FnXbGgk/W8qsWBqeBsxQiy/DW0dJ0bp/PI52KJYsI2MgbZEUti+YS+Gr7w5cghOJxPu6T1Hcik0FnUBpuXtlePtP5jDkDpGvGBV1E2yFGWr/5nJXH2GCY2X41k14orYbhmXIBcqQt3GhorsrSnWtGffi7cmi+Jd198PR8cRmb+R9w1DOBhvWxF9TeWbnpnbB/r7SWfT4jp957MBy7WgUo4TxZ7V+ReYMi3AapEfMAQltEmq6szwl095Z5BaP/3wbQ6bDaufbOADBz9JM1aglFRxFdIXctOy3VQyj6Pku45FR1IH7UGZi5ueZtkavgFny+VCyDEc7EGCiL5079ZQdd8cxPftu50aGx2Ap9iCGolxX1HdnqzPRCSSYOEsrDatPTUWbNsEmlAPLg9sM2zIUzbQF7k5MXGB0avu4gDaKgqJm4Ghrc3V1/ZeiKto+DLO8hHcEa4ExXIAt0sf2PhQzecWEddS9yXX4Q16pZ9WBDNHu1hUlleETKBmMf4R+cTPYn+E1ysDiGsqbErOzF9BQXK1KRZDi2cEBYGCKUbWPB+gs34AGRjq6lU/pVN3pFyHaogNnVGM3MFujPYAdGkNwmTAjjzRVs17PM8WsQerWmg3mvvQ9iG7xyu/LcCrpK3AemKnhDRno5EpqEtdJjWu9XoGC+oWilKi2ANJmv/BuPgCwOTMxcRBk1VTLvYazv3bcHi1WtgtlqAwYTuiFEjEz29lqfYDFVatwQZ4EggxNNXT6r3rbTcxKpdSvLJw6kwoDZI0OH+BiCwLO87Uy/NXTUGP+m+rbkRdatAkCzp/ie/C334dPH5gZk20Izhm2GT6FP/0OHTVfhoKADDeCrmKg1//pu7qi4pd2KtNjgtyA10EX27RlqNyaQvgTYSJ6Tet2c5tEhqXhqNPckumKpu33Lss783yDozq+DQWhAktBa+lI/B4GmN0LRQ9wIzcmw45PfYJZ7lBibbC7j6iCHEvDZfAz4NIpZG2jM1wpGq1MXXeNj1JZj/qk+kqpPe49ODZnlpCmT+wGz3CN1lF1hcH0Ah/odnplGF1PYmqge1iwVGeiPT1oEzOjAXD8DL1F0BtRq8Hx+r4rDKYW3ZVz1VQ+7tBEheBhKNa7hvYHbmJ0hauUWATdftLWKMWZOXCqUUrj5rSBSHxpjePH7zwklEIXw8IAIVrOQMYkXAaspugP153pHtRFGqJoQ6DCNmD2M9tXKVRQ0DOYMjhfheVLUIwBOGNDQR/GcBlGj6HOIkq1wzCruDXw2cSBZ1IKGR63j2AAmL4hkd6Ciwme/gZe1l9zRrRWSN3aTgBWMSPQI2p5k/eVnkGvxURTusXniwbbGpZvwNb4ZHRiJ/iRmmmA8ZmZ+RUoKaLpElyh6pQhOiXwyUTil96KlJKBI16i46j6yVCV03AxTq3I4Ae/qO6doJZhQ8GVO5inMUVTqb93+rvjx3/vYcEE+khbhkW//DcZQ1O6sno8BM6CF74vVlePQBBvbOQkaa2sfNxymoOJVU9cg/7wAKU+2OmrMoWkhIXgCY5Iy04AJjKx1JHhFsrQaSdSW2LnXc9mU7Jd7mLbV4SCTNlvZW0oDgtJc0/LfKSNtRk+i06gjYyUV90C//gK9PgEUtNbHaKAqSGPHcp750vx4MWoxXehiuvsOIstdHYpvd1cmk+M/9zrMJSuo4j9I6ksH6PcF55/eEsf2DsNnmOuzJ26ku4STVm5YThBhqg3/8h3PthfNlYxbZKz8I8m4vMLUtbTgHVVOoESH6/oVr6MorYPH3Jbk+2pD3dC03RfWY4SQ9qF+mjk0ZNm8/DlPsDVUqActQdu98/qYphy57kcNZ2FTLFnK7Yplut2vVeKzEIRxmpce8eQ5HWz+RL3+UmQDNFfOKsXOyF1VVGrH3duZDgLZqrVs+HEFEXp2YaQ8u5Ck9dnXCcyNjp2/7p5+CnQ89AYuLntza7EzxIN03K7vDOJ2XVIKUIvEyNTqFPpuM/OEMM0FNpvkBybzedocXIBthHbllJ0Z3vRdzCTNHFlgka6No9pMEPvsSamYTHR59wlJiiopVM3nXPOcfG6+bAMl0FRlF6DG3eq9VLHA6iO6Xl/8PMZVPoTCObHjr+Rp31Y7vGgY2Ovmof7gVFEQ9MOykRRUQ1TloV2Y5+KhnXhC2VDH4ZCFnr259jofaK4F0wYrm10lyIYH0N0+aEgdcvSVTXy9TPuXEuRoae8MbrYPERzE0hLv5dhe52imqo3buLPYlq2Bqml9zdNV4aejyPFhwGdE9KufEqill3YbtRNI59C5A3TLpTS5sDZkx7ISDBWgb7qBlJEixpEhVh62j/uoxvoCFAz28ANKlp5r+vzFSE5fLSlFW8NEineb36Cvbsn2O0tbl/7V3zG3YboD/1S/9FHh2+D6Jd2PL6zxN/WTlRJSTHu9j0FN/rqM0AALuMmaiN+St78OioDmlJchPaASvHY2PULuHf3QpTu3XzjLJ+1b2sodZDK+B0goqYhMqxB1d8qjS0eBmFsUE0rDi1mFoyv9O5MTfsookquQt6Gsjngr4w++gQP7lyIdHbN5rZGFZTU157tElPpPhqOjlYBWv2WtE3xn0EIkfpPSUeIEXHw4nq4MMFQ6t5XeTiDsW3aZybaxdj9T0F0vtElZtvewEp3hDhwnQpuw/44CAnKsSJARr5lL4/+Fcp3b0613CU6MLeFKNht78gsX3vBFKuR0b3KzFRevcB0viUkB/IjY/MmiNhNWqKKi5tQNNqDbqKP42DoT6rFfJ+vYJYck2OoobUp4Qsj8H+CqwDOClFduOpoJVOzjrVhqneCFunp9VrW7Le3qhGTZarVVYVY/nZbxfSzQKLTOFIsOr1uZpU5RWZ2x6t0AErHFLnk409YUhZiaVTQmi3Hkl+yVGIjmFE3aemS+qK82Z3iB/TETFvdGM+m7BKUW0kff4kKOlVAfpW0LMi3jGe0GZoBHWmT6H6TqqWgDM0URjlM2ba47JCdJTRqUGnIal9xlKlJeapFJfxaGi3p4FM2XdCDOnmpaXQFVktXlHpdr5SSStbCrEnP1wtZJweOeDYYCtwyplrbdGy72EJ++JGvcaZiNahRKU2au4e6ZltKNaOmIV02zUwRl18sTJmWx8WhZJGe3cgSvVphivjd5iR6GNaD631r0jLdRNcwClnDINXLVltyPmn1VNZ4PqwbdiHrnOMv2DE0NF/Nj+/zcnBnS5HjFUmlDMV6zMgbptAq1blCoi0VaSaYpUy7kL0p4EzJSC9m+BsY5us4mJ4N9GypFp/bLXcaGFVBZaqq6lbeFOp2oXjzRqVE7IiemRyQN6O/8XuVKYFtxBuO8eXdvXabrYut+0qtWGjZgsNONpLqwOKwDv0FqYgoZC0bdoPuKSLJubVLKN+0QsuVWja7XU237CmMXjg5Adnpt1Y9LHi76L1Xi4lFMAzYC5ohJ3kC5akpm2NqKkZCk3mpECVnGklLH1zad8kY8OLaw5CpBpStFMAQMET/uAElOdYFJGkaxE31Oxvcz7AOn5qe299U2YYiU2sBn551QXeC1FXLShIsS9fR4nCr+pXlOLEFLz0y5GOnBUUpBj7D7yC+6wxpuPg6Xh0oDfjs1dK8XKXjUo0AD0N1Q1pAn2/46aPfhLv3K2BWtn0hRec1Q66BwUQZ9oIe4ucghlD1SReYKveVc5jRW9hgeqwMh94zR7LMxzes4bj2hBi+xeRf6MsYRBv6LlFQAXomUnQ5BuXDR54zR/gilS6V0lBce0IMX3ygwos36MTY+Sevp9PLkO8oKkuiW4G3zUe9n9LRlGYVniOWA59aHHFO1HyuAtg8cejaZyJ6Oo8fUOUitJLkR/BzmDTybv6b9o0UN4IVWlDkA9ePh0KIJMPPwjY6fnSLct7inoI8YVKAx83F3rXLBSjIFAsYhokfF2hs6EWzV9LoLDJ8wizC/hZML7Gf4Yd/CgJG21Oy4AShSfSOBhLALbbokWEGsvxTFBoQfBnG0g7DscVgeok+DK9N6llziu7yiUCsAoceBTRtKPMPtSGn6X6mnm3IksjQmdccfbV/60mFu5GvdAL/uqZ2Upb2Yvfq8ZXDXiPC8gJ+Dz0MG/DBG7QlYyhp7n3GxIeDJxc0SVu7E0OEDF8+GaV5WFTUdDdFeRs+9zoClpTLvV8Dbsx/9TFES5N1/ObYfaR4lfMTI/K7vJuYRzqH509GeT+iSrlwZ/1yCZ73OnM0NWhMPQxfXkd6QQPgFTdaGH31cB/g1HOPuyZJuYUNuLwLfnzMnfMw+KgaZKduCCDjl0+8zpyMaTfDKjz3Bt5JslExg/8wNvbq8AXAxkIuLrlPd5Hi2tzpPcq572gCPn7P1UVSVLtCmip3NLAv5ExDsY+h96B4TKbd6mT+Y6OPms9RjJUH52vLS0tLy8snT91HMtxVFzW+AQ85Q/ru5dh2R4wo0g9e+eRtqPUwLGFq0c8Qd6vQjmpH7zebz9/0FkmKduHuxhnil8hwzN1l7vx9NcanLTLwqV8DMTTwMPRqsi7w3RqT3YRljI+fPv/Xm/2zs7OjNw3b1OlC8Ds7pSF1vB7DzeiIERpocZBsH0Mdl2Z/gWFERt1NU3m1HcyPjUbuP3pFD3e5z+/0U+pwd7kjXX7SCUqoQ4i7kSqlBTpp/6LpWbyKTrLbmJK99TJkJnrJKoU+ws2g3Bg92oUe7kIdIAst2u6dDYVrdJlbx6Ex7jZkXgwupftCb8z9ql1OE21S1etRyBwJGNQ48ZGp9xR7eMBOscUdZv/SKYZd3UvkE85F2OWX8PswbEBJdtlNtao16PcojsuXXZNsurkIgpecY9RjXbjDsX50hy97jCG/RYAuKFt6fenD0MTMyERydrrkVv29HoXSxhZ1Q2xeLkdd5bkIZSOyPNXA72Rj6S5zKnIWvUtkMmco0W2E/QyNKSiXsjWnSL6xu3wOH/oYWs51IFDOVls2ry1z4LdCXa7LhTvt2HBD4wk+DX7JnERb1IdhzJFc7d75Wm4kHl9Ae9svwzQ8WKPH1fFCerZYLG0XsxX+rWwsTN/twRNtDXN0T37HGS5r9N4nry1lecypdk+XpulxJyP8M33fQiSFv3+CUVpu4aYz4kYxJ3N3/sQoaRdeNj0xiUnHYeY0yjq8MQ1dSIPsO8/tQB3wFALoD0w5VTYMQePx6aW1hYWThYXT5el4EOf4MCrtiyup+EK3ImHW0WdFkGGp59jvNGDA4Kkwojt42rElmhboUyLjD/riSj2GwczVSCfr6NVS9PHdh0ale/C4aHfeF/lDocpD0bHgIIYeLU3G0KvvSnyc8aG3FMoML8M12Fo5y4gRkR8eonvSisNzFf0Il9NPz3sHFGQ6DUMlMlJAb8EUI7JST8NFOv1lIroOim5/FJgY2Yb3aFGG6XFQGNJcnP29q3qPxhLzQj6UloPH114zKcq4yborhNL5RXTiGMw/HBxDI58+m5k4rswNjwTJ0hxHJ8FW3DM0TLT41VakZWgm3/QxjGD+3tONkE7er/JT+5PRFSjTIf71fwd/v3cXcuVEdPKoapi2IDIm5ustIsgvQfRjyMOV3ouvpn+Ff9NzIukOGMR69CLoOyR6kYPVxA4US7BDj2ex4WfIUv3Pfe/t9aI3pJG3vZdASiNxKT4HiXl4vRRfwz80BBcQdEF6DfBvDIY3o7OQtiGBqgavXRlN78Ebu6exyFRhqr9lRj/Gz+lpu+j6lp4uDJOO0uqWl6TcOczS5S50D0EC1lwRadrVwfovjd7n5wg1/wlubWRhwflH8MfWvdAwuNR+XZk5uLy6qh3jZmoT0JaQ8CaozH2+o6KIyVhx4DUfw/2IUun87D+VOY0emXR2k31LJwd0uWzMfPeuzpiS+vix3qoNRTPpO4A6dkLHsHEXnd+Yemnhl81jzH7orqtMUoaLC1Tjy6Hydd8CV8e07gAZLc2vJ1f0rC/yAzvRiQs4H5JHH/1ewNxHip/8TDELkC+/eDpMjzv8vYCJ/uwzWMstwcr8WfAXJP43IF3x0lh8Af7z6zDMHfwXML3MrYu0fDIU0zH/DbjWRfufVNEQIUKECBEiRIgQIUKECBEiRIgQIUKECBEiRIgQIUKECBEiRIgQIX4o/D8YvKEKZaXVRQAAAABJRU5ErkJggg==")
              )
          ),
          DinosaurSpecies(
            speciesName: 'Velociraptor',
            image: GraphicalItem(
              type: Graphical.image,
              item: Image.network(
                "https://pbs.twimg.com/media/EtaQfDJXUAQUPf-.jpg"
              )
            )
          ), DinosaurSpecies(
              speciesName: 'Chicken',
              image:

              GraphicalItem(
                  type: Graphical.image,
                  item: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVCqNn78bTDf2LkQ54nK95VQHjct6y60xvmutfmDh-6U6TVYzX6KxK4wTbhxyU4KfP7QE&usqp=CAU")
              )
          ),
    ])
          DinosaurSpeciesCard(species: species)

      ]
    );
  }
}
