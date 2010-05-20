@call ..\myldr books.ctl
@call ..\myldr authors.ctl
@call ..\myldr customers.ctl
@call ..\myldr sales.ctl
@call ..\myldr authorship.ctl
@call ..\myldr sale_prices.ctl
@call ..\myldr orders.ctl
@call ..\myldr line_items.ctl

@echo ----------
@echo Bad Files:
@dir /B *.dir
