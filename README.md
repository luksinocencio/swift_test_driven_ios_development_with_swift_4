# test_driven_ios_development_with_swift_4

Mocks: Eles atuam como gravadores. Eles registram se SUT chama os métodos esperados de outra instância com argumentos esperados. Por exemplo, se tivermos a Classe A que deve chamar o método b() da classe B, quando algo acontecer, criaremos um mock para B que define um valor boolean como true caso b() seja chamado, No Teste, usamos esse valor booleano para confirmar se b() foi chamado.

Stubs: Estes são usados quando precisamos de valores de retorno definidos de um método. Em um teste, geralmente é util ter um valor de retorno fixo codificado para um método que o SUT chama. O teste então afirma que o SUT reage de maneira esperada ao valor de retorno definido. Isso facilita o teste de muitos cenários diferentes sem configurações complicadas.

Fakes: Eles agem como substitutos para objetos reais com os quais um sistema em teste se comunica. Eles são necessários para fazer o código compilar, mas não necessários para afirmar que algo esperado aconteceu. As falsificações são frequentemente usadas quando são mais fáceis de configurar do que os objetos reais, ou quando precisamos ter certeza de que o teste é independente da implementação do objeto real.
