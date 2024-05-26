/*
هو Pattern بيخليك تعمل Instance واحد من الـClass أو الـObject عشان تستخدمه كذا مرة في كذا
بتستخدمه لما يكون عندك Class كبير من ناحية الـPerformance والـMemory + بتستخدمه فى كذا مكان فى الـApp بتاعك
                                                 في طريقتين للـCreate:
 -1 الـEager Initialization: ولكن ليه Pros&Cons: الـPros إنه ThreadSafe لما يكون
الـApp بتاعك صغير ومبيحتاجوش Services كتير + جميل بإنك بتكتب سطر Code واحد
وسريع والدنيا تمام
الـConsequences : إن لو عندك عدد كبير من الـService بيحتاجوه فالزم يتعملهم
Create أول مالـSystem يقوم وبالتالي بيسبب بطئ فى الـPerformance + بيتعملهم
Create بـHashCode مختلف فبياكل مساحة Memory كبيرة
                                                      وهنا بنلجأ للحل األكثر مرونة أال وهو:
-1 الـInitialization Lazy: هنا بنخلي الـInstance نايمة + لما حد يـ Callـها يتعملها Activation
 */
