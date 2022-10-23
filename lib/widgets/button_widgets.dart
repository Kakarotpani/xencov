import 'package:flutter/material.dart';

ButtonStyle appButtonStyle(bool isPrimary, BuildContext context){
  return ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size(
      MediaQuery.of(context).size.width / 2.28,
      MediaQuery.of(context).size.height / 10,
    )),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),  
      )
    ),
    backgroundColor: isPrimary
    ? MaterialStateProperty.all(Colors.orange)
    : MaterialStateProperty.all(Colors.grey)
  );
}

/* class AppButton extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final Function() onTap;
  final IconData? icon;

  const AppButton({
    Key? key,
    required this.label,
    required this.isPrimary,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: size.height / 10,
        width: size.width / 2.28,
        decoration: BoxDecoration(
          color: widget.isPrimary 
          ? Colors.orange
          : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          children: [
            Visibility(
              visible: (widget.icon == null) ? false : true,   
              replacement: const SizedBox(),
              child: Expanded(
                child: CircleAvatar(
                  backgroundColor:const Color.fromARGB(150, 241, 237, 237),
                  child: Icon(widget.icon, color: Colors.white)
                )
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: (widget.icon == null) ? 1 : 2,
              child: Wrap(
                children: [
                  Text(widget.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
 */