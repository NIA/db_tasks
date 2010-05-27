@call ..\myldr points.ctl
@call ..\myldr objects.ctl
@call ..\myldr point_objs.ctl
@call ..\myldr membership.ctl
@call ..\myldr point_memb.ctl
@call ..\myldr attributes.ctl
@call ..\myldr point_attrs.ctl

@echo ----------
@echo Bad Files:
@dir /B *.bad
