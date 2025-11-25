import 'package:flutter/material.dart';

class CollapsibleCard extends StatefulWidget {
  final String title;
  final Widget child;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final IconData? leadingIcon;
  final Color? titleColor;
  final double? titleFontSize;
  final List<Widget>? trailingActions;
  final Color? color;

  const CollapsibleCard({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = true,
    this.margin,
    this.padding,
    this.elevation,
    this.leadingIcon,
    this.titleColor,
    this.titleFontSize,
    this.trailingActions,
    this.color,
  });

  @override
  CollapsibleCardState createState() => CollapsibleCardState();
}

class CollapsibleCardState extends State<CollapsibleCard>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: widget.elevation ?? 4,
      margin: widget.margin ?? const EdgeInsets.all(16),
      color: widget.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête cliquable
          InkWell(
            onTap: _toggleExpanded,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: Container(
              padding: widget.padding ?? const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (widget.leadingIcon != null) ...[
                    Icon(
                      widget.leadingIcon,
                      color:
                          widget.titleColor ?? Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: widget.titleColor,
                            fontSize: widget.titleFontSize,
                          ),
                    ),
                  ),
                  // Actions supplémentaires (comme le bouton screenshot)
                  if (widget.trailingActions != null) ...[
                    ...widget.trailingActions!,
                    const SizedBox(width: 8),
                  ],
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: widget.titleColor ?? Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Contenu collapsible
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: FadeTransition(
              opacity: _expandAnimation,
              child: Container(
                padding:
                    widget.padding ?? const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_isExpanded) const Divider(),
                    widget.child,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
