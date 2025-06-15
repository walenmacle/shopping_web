package com.taobao.util;

import com.taobao.entity.*;
import com.taobao.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Component
@RequiredArgsConstructor
public class DataInitializer implements CommandLineRunner {

    private final CustomerRepository customerRepository;
    private final SellerRepository sellerRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;
    private final ReviewRepository reviewRepository;
    private final SalesStatisticsRepository salesStatisticsRepository;

    private static final String[] PRODUCT_NAMES = {
            "iPhone 13 Pro", "MacBook Air", "iPad Pro", "AirPods Pro", "Apple Watch",
            "Samsung Galaxy S21", "Samsung Note 20", "Samsung Tab S7", "Galaxy Buds", "Galaxy Watch",
            "华为P40 Pro", "华为MateBook", "华为平板M6", "华为FreeBuds", "华为手表GT2",
            "小米11", "RedmiBook", "小米平板5", "小米耳机Pro", "小米手环6",
            "OPPO Find X3", "OPPO笔记本", "OPPO Pad", "OPPO Enco", "OPPO手表",
            "Vivo X60", "Vivo笔记本", "Vivo平板", "Vivo TWS", "Vivo手表",
            "一加9 Pro", "森海塞尔耳机", "罗技鼠标", "雷蛇键盘", "戴尔XPS",
            "惠普Spectre", "联想ThinkPad", "华硕ZenBook", "微软Surface", "宏碁Swift",
            "LG电视", "索尼相机", "尼康相机", "佳能相机", "富士相机",
            "耐克运动鞋", "阿迪达斯外套", "安德玛裤子", "彪马背包", "李宁跑鞋",
            "宜家沙发", "全友床", "欧派橱柜", "索菲亚衣柜", "美的冰箱",
            "海尔洗衣机", "格力空调", "方太油烟机", "九阳豆浆机", "小熊电饭煲"
    };

    private static final String[] PRODUCT_DESCRIPTIONS = {
            "最新款，性能强劲，外观精美，值得购买",
            "高端品质，做工精良，用户体验出色",
            "性价比极高，功能齐全，适合大众使用",
            "经典设计，稳定耐用，深受用户喜爱",
            "创新科技，引领潮流，改变生活方式",
            "限量版特别款，收藏价值高",
            "轻薄便携，续航持久，办公首选",
            "高清显示，音质出众，娱乐体验佳",
            "智能操控，人性化设计，使用便捷",
            "环保材质，安全健康，适合家庭使用"
    };

    private static final String[] IMAGE_URLS = {
            "https://picsum.photos/id/1/400/400",
            "https://picsum.photos/id/20/400/400",
            "https://picsum.photos/id/30/400/400",
            "https://picsum.photos/id/40/400/400",
            "https://picsum.photos/id/50/400/400",
            "https://picsum.photos/id/60/400/400",
            "https://picsum.photos/id/70/400/400",
            "https://picsum.photos/id/80/400/400",
            "https://picsum.photos/id/90/400/400",
            "https://picsum.photos/id/100/400/400"
    };

    private static final String[] SELLER_NAMES = {
            "京东自营", "天猫官方旗舰店", "苏宁易购", "拼多多", "唯品会",
            "小米官方旗舰店", "华为授权店", "Apple专卖店", "三星官方旗舰店", "OPPO官方旗舰店",
            "耐克官方店", "阿迪达斯旗舰店", "李宁官方旗舰店", "安德玛专卖店", "彪马旗舰店",
            "海尔电器旗舰店", "美的电器官方店", "格力空调专卖店", "方太厨卫旗舰店", "小熊电器官方店"
    };

    private static final String[] SELLER_DESCRIPTIONS = {
            "官方授权，正品保障，售后无忧",
            "品牌直营，价格优惠，服务一流",
            "专业经营10年，信誉保证",
            "全场包邮，七天无理由退换",
            "大型连锁，覆盖全国，就近发货",
            "厂家直销，没有中间商赚差价",
            "线上线下同步，体验更佳",
            "专注品质，用心服务每一位顾客",
            "创立于2010年，业内领先品牌",
            "新店开业，优惠多多，欢迎惠顾"
    };

    private static final String[] PROVINCES = {
            "北京市", "上海市", "广东省", "江苏省", "浙江省",
            "四川省", "湖北省", "湖南省", "河南省", "河北省"
    };

    private static final String[] CITIES = {
            "北京市", "上海市", "广州市", "深圳市", "杭州市",
            "南京市", "成都市", "武汉市", "长沙市", "郑州市"
    };

    private static final String[] DISTRICTS = {
            "朝阳区", "海淀区", "浦东新区", "徐汇区", "天河区",
            "福田区", "西湖区", "鼓楼区", "武侯区", "江岸区"
    };

    private static final String[] LOGISTICS_COMPANIES = {
            "顺丰速运", "中通快递", "圆通速递", "申通快递", "韵达快递",
            "百世快递", "邮政EMS", "天天快递", "德邦物流", "京东物流"
    };

    private static final String[] CUSTOMER_NAMES = {
            "张三", "李四", "王五", "赵六", "钱七",
            "孙八", "周九", "吴十", "郑十一", "王十二",
            "刘明", "陈亮", "林芳", "黄强", "周红",
            "吴光", "郑晓", "王小", "李大", "张中"
    };

    private static final Random random = new Random();

    @Override
    @Transactional
    public void run(String... args) {
        initializeData();
    }
    
    @Transactional
    public void run() {
        initializeData();
    }
    
    private void initializeData() {
        initializeData(false);
    }
    
    public void initializeData(boolean force) {
        // 检查是否已有数据，如果有则不初始化（除非强制）
        if (!force && customerRepository.count() > 0) {
            System.out.println("数据库中已有数据，跳过初始化");
            return;
        }

        System.out.println("开始初始化数据...");
        
        // 生成卖家数据
        List<Seller> sellers = createSellers();
        
        // 生成客户数据
        List<Customer> customers = createCustomers();
        
        // 生成产品数据
        List<Product> products = createProducts(sellers);
        
        // 生成订单和订单项
        List<Order> orders = createOrders(customers, sellers, products);
        
        // 生成评论
        createReviews(customers, products, orders);
        
        // 生成销售统计
        createSalesStatistics(sellers, products);
        
        System.out.println("数据初始化完成");
    }
    
    private List<Seller> createSellers() {
        List<Seller> sellers = new ArrayList<>();
        
        for (int i = 0; i < 20; i++) {
            Seller seller = new Seller();
            seller.setName(SELLER_NAMES[i % SELLER_NAMES.length]);
            seller.setAddress(getRandomAddress());
            seller.setLicenseNumber("L" + (100000 + random.nextInt(900000)));
            seller.setDescription(SELLER_DESCRIPTIONS[i % SELLER_DESCRIPTIONS.length]);
            seller.setRating(3.5 + random.nextDouble() * 1.5);  // 3.5-5.0之间的评分
            seller.setContactPhone("1" + (3 + random.nextInt(6)) + randomNumbers(9));
            seller.setContactEmail(pinyin(seller.getName()) + "@example.com");
            
            sellers.add(seller);
        }
        
        return sellerRepository.saveAll(sellers);
    }
    
    private List<Customer> createCustomers() {
        List<Customer> customers = new ArrayList<>();
        
        for (int i = 0; i < 50; i++) {
            Customer customer = new Customer();
            String name = CUSTOMER_NAMES[i % CUSTOMER_NAMES.length] + (i / CUSTOMER_NAMES.length + 1);
            customer.setUsername("user" + (i + 1));
            customer.setPassword("password" + (i + 1));
            customer.setName(name);
            customer.setPhone("1" + (3 + random.nextInt(6)) + randomNumbers(9));
            customer.setEmail("user" + (i + 1) + "@example.com");
            
            Customer savedCustomer = customerRepository.save(customer);
            
            // 为每个客户创建1-3个地址
            int addressCount = 1 + random.nextInt(3);
            List<Address> addresses = new ArrayList<>();
            
            for (int j = 0; j < addressCount; j++) {
                Address address = new Address();
                address.setCustomer(savedCustomer);
                address.setReceiver(name);
                address.setPhone(customer.getPhone());
                address.setProvince(PROVINCES[random.nextInt(PROVINCES.length)]);
                address.setCity(CITIES[random.nextInt(CITIES.length)]);
                address.setDistrict(DISTRICTS[random.nextInt(DISTRICTS.length)]);
                address.setDetail("XX路XX号" + randomNumbers(2) + "栋" + randomNumbers(3) + "室");
                address.setIsDefault(j == 0);  // 第一个地址设为默认
                
                addresses.add(address);
            }
            
            savedCustomer.setAddresses(addresses);
            customers.add(customerRepository.save(savedCustomer));
        }
        
        return customers;
    }
    
    private List<Product> createProducts(List<Seller> sellers) {
        List<Product> products = new ArrayList<>();
        
        for (int i = 0; i < 200; i++) {
            Product product = new Product();
            product.setName(PRODUCT_NAMES[i % PRODUCT_NAMES.length] + " " + randomProductSuffix());
            product.setDescription(PRODUCT_DESCRIPTIONS[random.nextInt(PRODUCT_DESCRIPTIONS.length)]);
            // 设置随机价格，100-5000之间
            BigDecimal price = new BigDecimal(100 + random.nextInt(4900));
            price = price.setScale(2, RoundingMode.HALF_UP);
            product.setPrice(price);
            product.setStock(10 + random.nextInt(990));  // 10-999之间的库存
            product.setImageUrl(IMAGE_URLS[random.nextInt(IMAGE_URLS.length)]);
            product.setSeller(sellers.get(random.nextInt(sellers.size())));
            
            products.add(product);
        }
        
        return productRepository.saveAll(products);
    }
    
    private List<Order> createOrders(List<Customer> customers, List<Seller> sellers, List<Product> products) {
        List<Order> orders = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        
        // 按卖家分组产品
        Map<Seller, List<Product>> productsBySeller = products.stream()
                .collect(Collectors.groupingBy(Product::getSeller));
        
        for (int i = 0; i < 500; i++) {
            Customer customer = customers.get(random.nextInt(customers.size()));
            Seller seller = sellers.get(random.nextInt(sellers.size()));
            
            // 获取该卖家的产品
            List<Product> sellerProducts = productsBySeller.get(seller);
            if (sellerProducts == null || sellerProducts.isEmpty()) {
                continue;
            }
            
            Order order = new Order();
            order.setOrderNumber(sdf.format(new Date()) + randomNumbers(4));
            order.setCustomer(customer);
            order.setSeller(seller);
            
            // 随机选择地址
            List<Address> addresses = customer.getAddresses();
            order.setShippingAddress(addresses.get(random.nextInt(addresses.size())));
            
            // 随机设置订单状态
            Order.OrderStatus[] statuses = Order.OrderStatus.values();
            Order.OrderStatus status = statuses[random.nextInt(statuses.length)];
            order.setStatus(status);
            
            // 设置支付状态
            if (status == Order.OrderStatus.PENDING) {
                order.setPaymentStatus(Order.PaymentStatus.UNPAID);
            } else if (status == Order.OrderStatus.CANCELED) {
                order.setPaymentStatus(random.nextBoolean() ? 
                        Order.PaymentStatus.UNPAID : Order.PaymentStatus.REFUNDED);
            } else {
                order.setPaymentStatus(Order.PaymentStatus.PAID);
            }
            
            // 设置物流状态
            if (status == Order.OrderStatus.PENDING || status == Order.OrderStatus.CANCELED) {
                order.setLogisticsStatus(Order.LogisticsStatus.PENDING);
            } else if (status == Order.OrderStatus.PAID) {
                order.setLogisticsStatus(Order.LogisticsStatus.PROCESSING);
            } else if (status == Order.OrderStatus.SHIPPED) {
                order.setLogisticsStatus(Order.LogisticsStatus.SHIPPED);
            } else {
                order.setLogisticsStatus(Order.LogisticsStatus.DELIVERED);
            }
            
            // 添加物流信息
            if (status != Order.OrderStatus.PENDING && status != Order.OrderStatus.CANCELED) {
                order.setLogisticsCompany(LOGISTICS_COMPANIES[random.nextInt(LOGISTICS_COMPANIES.length)]);
                order.setTrackingNumber(randomNumbers(12));
            }
            
            // 创建订单项 (1-5件商品)
            int itemCount = 1 + random.nextInt(5);
            List<OrderItem> orderItems = new ArrayList<>();
            BigDecimal totalAmount = BigDecimal.ZERO;
            
            Set<Integer> productIndices = getRandomIndices(sellerProducts.size(), itemCount);
            
            for (int idx : productIndices) {
                Product product = sellerProducts.get(idx);
                int quantity = 1 + random.nextInt(5);  // 每个商品1-5件
                
                OrderItem orderItem = new OrderItem();
                orderItem.setOrder(order);
                orderItem.setProduct(product);
                orderItem.setQuantity(quantity);
                orderItem.setUnitPrice(product.getPrice());
                
                BigDecimal subtotal = product.getPrice().multiply(BigDecimal.valueOf(quantity));
                orderItem.setSubtotal(subtotal);
                
                totalAmount = totalAmount.add(subtotal);
                orderItems.add(orderItem);
            }
            
            order.setOrderItems(orderItems);
            order.setTotalAmount(totalAmount);
            
            // 设置创建时间 (过去90天内随机时间)
            Date createdAt = getRandomDateInPast(90);
            order.setCreatedAt(createdAt);
            if (status != Order.OrderStatus.PENDING) {
                // 更新时间在创建时间之后
                Date updatedAt = getRandomDateAfter(createdAt, 7);  // 假设最多7天后更新
                order.setUpdatedAt(updatedAt);
            } else {
                order.setUpdatedAt(order.getCreatedAt());
            }
            
            orders.add(order);
        }
        
        return orderRepository.saveAll(orders);
    }
    
    private void createReviews(List<Customer> customers, List<Product> products, List<Order> orders) {
        List<Review> reviews = new ArrayList<>();
        
        // 从已完成的订单中创建评论
        List<Order> completedOrders = orders.stream()
                .filter(o -> o.getStatus() == Order.OrderStatus.COMPLETED)
                .collect(Collectors.toList());
        
        for (Order order : completedOrders) {
            // 30%概率该订单下的产品有评论
            if (random.nextInt(10) < 3) {
                Customer customer = order.getCustomer();
                
                for (OrderItem item : order.getOrderItems()) {
                    // 50%概率评论该订单项
                    if (random.nextInt(10) < 5) {
                        Product product = item.getProduct();
                        
                        Review review = new Review();
                        review.setProduct(product);
                        review.setCustomer(customer);
                        review.setRating(3 + random.nextInt(3));  // 3-5星评价
                        
                        StringBuilder comment = new StringBuilder();
                        comment.append(getRandomReviewPrefix());
                        comment.append(product.getName());
                        comment.append(getRandomReviewSuffix());
                        
                        review.setComment(comment.toString());
                        
                        // 20%概率上传图片
                        if (random.nextInt(10) < 2) {
                            int imageCount = 1 + random.nextInt(3);
                            List<String> images = new ArrayList<>();
                            for (int i = 0; i < imageCount; i++) {
                                images.add(IMAGE_URLS[random.nextInt(IMAGE_URLS.length)]);
                            }
                            review.setImageUrls(String.join(",", images));
                        }
                        
                        // 设置评论时间为订单完成后1-3天
                        Date reviewDate = getRandomDateAfter(order.getUpdatedAt(), 3);
                        review.setCreatedAt(reviewDate);
                        
                        reviews.add(review);
                    }
                }
            }
        }
        
        reviewRepository.saveAll(reviews);
    }
    
    private void createSalesStatistics(List<Seller> sellers, List<Product> products) {
        List<SalesStatistics> allStatistics = new ArrayList<>();
        
        // 按卖家分组产品
        Map<Seller, List<Product>> productsBySeller = products.stream()
                .collect(Collectors.groupingBy(Product::getSeller));
        
        // 为过去90天创建销售统计
        Date today = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(today);
        calendar.add(Calendar.DAY_OF_MONTH, -90);
        Date startDate = calendar.getTime();
        
        for (Seller seller : sellers) {
            List<Product> sellerProducts = productsBySeller.get(seller);
            if (sellerProducts == null || sellerProducts.isEmpty()) {
                continue;
            }
            
            // 为每个卖家创建每天的销售统计
            calendar.setTime(startDate);
            while (!calendar.getTime().after(today)) {
                Date currentDate = calendar.getTime();
                
                // 创建卖家当天总销售统计
                SalesStatistics sellerDailyStats = new SalesStatistics();
                sellerDailyStats.setSeller(seller);
                sellerDailyStats.setStatisticsDate(currentDate);
                
                int totalQuantity = 0;
                BigDecimal totalAmount = BigDecimal.ZERO;
                
                // 为该卖家的每个产品创建销售统计
                for (Product product : sellerProducts) {
                    // 50%概率该产品当天有销量
                    if (random.nextInt(10) < 5) {
                        int quantity = random.nextInt(10);  // 0-9件
                        if (quantity > 0) {
                            SalesStatistics productStats = new SalesStatistics();
                            productStats.setProduct(product);
                            productStats.setSeller(seller);
                            productStats.setStatisticsDate(currentDate);
                            productStats.setSalesQuantity(quantity);
                            
                            BigDecimal amount = product.getPrice().multiply(BigDecimal.valueOf(quantity));
                            productStats.setSalesAmount(amount);
                            
                            productStats.setCreatedAt(currentDate);
                            productStats.setUpdatedAt(currentDate);
                            
                            allStatistics.add(productStats);
                            
                            totalQuantity += quantity;
                            totalAmount = totalAmount.add(amount);
                        }
                    }
                }
                
                // 只有当有销售时才添加卖家统计
                if (totalQuantity > 0) {
                    sellerDailyStats.setSalesQuantity(totalQuantity);
                    sellerDailyStats.setSalesAmount(totalAmount);
                    sellerDailyStats.setCreatedAt(currentDate);
                    sellerDailyStats.setUpdatedAt(currentDate);
                    
                    allStatistics.add(sellerDailyStats);
                }
                
                calendar.add(Calendar.DAY_OF_MONTH, 1);
            }
        }
        
        salesStatisticsRepository.saveAll(allStatistics);
    }
    
    // 工具方法
    
    private String randomNumbers(int length) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }
    
    private String getRandomAddress() {
        String province = PROVINCES[random.nextInt(PROVINCES.length)];
        String city = CITIES[random.nextInt(CITIES.length)];
        String district = DISTRICTS[random.nextInt(DISTRICTS.length)];
        return province + city + district + "XX路XX号" + randomNumbers(3) + "号";
    }
    
    private String randomProductSuffix() {
        String[] colors = {"黑色", "白色", "红色", "蓝色", "金色"};
        String[] versions = {"标准版", "豪华版", "限量版", "纪念版", "青春版"};
        String[] sizes = {"S", "M", "L", "XL", "XXL"};
        
        return colors[random.nextInt(colors.length)] + " " + 
               versions[random.nextInt(versions.length)] + " " + 
               sizes[random.nextInt(sizes.length)];
    }
    
    private Set<Integer> getRandomIndices(int max, int count) {
        count = Math.min(count, max);
        Set<Integer> indices = new HashSet<>();
        while (indices.size() < count) {
            indices.add(random.nextInt(max));
        }
        return indices;
    }
    
    private Date getRandomDateInPast(int days) {
        return Date.from(LocalDate.now()
                .minusDays(random.nextInt(days))
                .atStartOfDay(ZoneId.systemDefault())
                .toInstant());
    }
    
    private Date getRandomDateAfter(Date baseDate, int maxDays) {
        long baseTime = baseDate.getTime();
        // 在基准时间之后的0-maxDays天之间随机选择一个时间
        long randomOffset = ThreadLocalRandom.current().nextLong(0, maxDays * 24 * 60 * 60 * 1000L);
        return new Date(baseTime + randomOffset);
    }
    
    private String getRandomReviewPrefix() {
        String[] prefixes = {
            "这个", "刚买的", "用了一段时间的", "非常喜欢这个", "很满意", 
            "终于入手了", "一直想买的", "朋友推荐的", "看了很久的", "性价比很高的"
        };
        return prefixes[random.nextInt(prefixes.length)];
    }
    
    private String getRandomReviewSuffix() {
        String[] suffixes = {
            "，质量不错，值得购买！", "，做工精良，很喜欢。", "，比想象中好用，推荐购买。",
            "，性价比高，会考虑回购。", "，很满意，符合预期。", "，快递很快，服务态度好。",
            "，使用效果不错，很满意。", "，外观漂亮，功能齐全。", "，很实用，朋友都说好。",
            "，价格实惠，值得拥有。"
        };
        return suffixes[random.nextInt(suffixes.length)];
    }
    
    // 简易拼音转换
    private String pinyin(String chinese) {
        // 简化处理，仅用于示例
        return chinese.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();
    }
} 