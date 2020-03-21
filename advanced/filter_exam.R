mpg_1 <- mpg %>% 
            group_by(class) %>% 
            summarise(class_cty = mean(cty)) 
mpg_1 %>% arrange(desc(class_cty))

mpg_2 <- mpg %>% 
            group_by(manufacturer) %>% 
            summarise(hwy_avg = mean(hwy)) %>% 
            arrange(desc(hwy_avg))
head(mpg_2, 3)

mpg_3 <- mpg %>% 
            filter(class == "compact") %>% 
            group_by(manufacturer) %>% 
            summarise(compact_num = n()) %>% 
            arrange(desc(compact_num))
mpg_3
