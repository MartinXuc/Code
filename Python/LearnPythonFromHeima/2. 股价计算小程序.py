name = '传智播客'
stock_price_current = 19.99
stock_code = '003032'
stock_price_daily_growth_factor = 1.2
growth_days = 7
stock_price_future = (
    stock_price_current 
    * growth_days 
    ** stock_price_daily_growth_factor
)
print(
    f'公司：{name},股票代码：{stock_code},当前股价：{stock_price_current}\n'
    +
    '每日增长的系数是：%.2f，经过%d的增长后，股价达到了%.2f' % (stock_price_daily_growth_factor, growth_days, stock_price_future)
)