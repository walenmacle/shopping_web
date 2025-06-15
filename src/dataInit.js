const axios = require('axios');

async function initializeData() {
  console.log('开始执行数据初始化...');
  
  try {
    // 模拟登录
    console.log('Step 1: 模拟登录...');
    
    // 初始化数据
    console.log('Step 2: 初始化数据...');
    
    // 使用正确的API路径
    const response = await axios.post('http://localhost:8080/api/admin/init-data', {}, {
      headers: {
        'Authorization': 'Bearer mock_token'
      }
    });
    
    console.log('数据初始化响应:', response.data);
    console.log('数据初始化成功! 系统现在包含:');
    console.log('- 20个卖家账户');
    console.log('- 50个客户账户');
    console.log('- 200个商品信息');
    console.log('- 500个订单记录');
    console.log('- 商品评论数据');
    console.log('- 过去90天的销售统计数据');
  } catch (error) {
    console.error('初始化失败:', error.message);
    if (error.response) {
      console.error('错误详情:', error.response.data);
      console.error('状态码:', error.response.status);
    } else {
      console.error('完整错误:', error);
    }
  }
}

// 执行初始化
console.log('正在连接到 http://localhost:8080/api/admin/init-data...');
initializeData(); 