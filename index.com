<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NovaMix | Importados & Tecnologia</title>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, Helvetica, sans-serif;
    }

    :root {
      --azul: #2563eb;
      --azul-escuro: #111827;
      --roxo: #7c3aed;
      --roxo-claro: #a855f7;
      --fundo: #f5f7ff;
      --branco: #ffffff;
      --cinza: #6b7280;
      --verde: #16a34a;
      --vermelho: #dc2626;
    }

    body {
      background: var(--fundo);
      color: #111827;
    }

    /* HEADER */
    header {
      position: sticky;
      top: 0;
      z-index: 1000;
      background: linear-gradient(135deg, #111827, #312e81, #2563eb);
      color: white;
      box-shadow: 0 4px 20px rgba(0,0,0,.15);
    }

    .topo {
      max-width: 1250px;
      margin: auto;
      padding: 18px 20px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 20px;
    }

    .logo {
      font-size: 27px;
      font-weight: 900;
      white-space: nowrap;
    }

    .logo span {
      color: #a78bfa;
    }

    .busca {
      flex: 1;
      max-width: 600px;
      position: relative;
    }

    .busca input {
      width: 100%;
      padding: 14px 50px 14px 18px;
      border: none;
      border-radius: 30px;
      outline: none;
      font-size: 15px;
    }

    .icone-busca {
      position: absolute;
      right: 18px;
      top: 12px;
      font-size: 20px;
    }

    .acoes {
      display: flex;
      gap: 10px;
      align-items: center;
    }

    .btn-carrinho {
      border: 0;
      background: white;
      color: #312e81;
      padding: 12px 18px;
      border-radius: 25px;
      cursor: pointer;
      font-weight: bold;
      position: relative;
    }

    #contadorCarrinho {
      position: absolute;
      right: -5px;
      top: -7px;
      background: #ef4444;
      color: white;
      width: 22px;
      height: 22px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 12px;
    }

    /* CATEGORIAS */
    .categorias {
      background: white;
      border-bottom: 1px solid #e5e7eb;
    }

    .categorias-container {
      max-width: 1250px;
      margin: auto;
      padding: 12px 20px;
      display: flex;
      gap: 10px;
      overflow-x: auto;
    }

    .categoria {
      border: 1px solid #ddd6fe;
      background: white;
      color: #4c1d95;
      padding: 9px 18px;
      border-radius: 25px;
      cursor: pointer;
      white-space: nowrap;
      transition: .2s;
    }

    .categoria:hover,
    .categoria.ativa {
      background: linear-gradient(135deg, var(--azul), var(--roxo));
      color: white;
      border-color: transparent;
    }

    /* HERO */
    .hero {
      max-width: 1250px;
      margin: 25px auto;
      padding: 0 20px;
    }

    .banner {
      min-height: 330px;
      border-radius: 25px;
      padding: 55px;
      display: flex;
      align-items: center;
      background:
        radial-gradient(circle at 90% 20%, rgba(168,85,247,.8), transparent 30%),
        linear-gradient(120deg, #111827, #312e81, #2563eb);
      color: white;
      overflow: hidden;
      position: relative;
    }

    .banner::after {
      content: "✦";
      position: absolute;
      right: 12%;
      bottom: -50px;
      font-size: 300px;
      color: rgba(255,255,255,.07);
    }

    .banner-texto {
      max-width: 650px;
      position: relative;
      z-index: 2;
    }

    .banner h1 {
      font-size: clamp(35px, 5vw, 62px);
      line-height: 1;
      margin-bottom: 18px;
    }

    .banner h1 span {
      color: #c4b5fd;
    }

    .banner p {
      color: #e5e7eb;
      font-size: 18px;
      margin-bottom: 25px;
      line-height: 1.6;
    }

    .btn-banner {
      display: inline-block;
      padding: 14px 25px;
      background: white;
      color: #312e81;
      border-radius: 12px;
      font-weight: bold;
      cursor: pointer;
      border: none;
    }

    /* PRODUTOS */
    .container {
      max-width: 1250px;
      margin: auto;
      padding: 10px 20px 50px;
    }

    .titulo-secao {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin: 20px 0;
      gap: 15px;
    }

    .titulo-secao h2 {
      font-size: 28px;
    }

    .ordenacao {
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 8px;
      background: white;
    }

    .produtos {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 20px;
    }

    .produto {
      background: white;
      border-radius: 18px;
      overflow: hidden;
      box-shadow: 0 4px 18px rgba(15,23,42,.07);
      transition: .25s;
      border: 1px solid #eef0f6;
      position: relative;
    }

    .produto:hover {
      transform: translateY(-5px);
      box-shadow: 0 12px 30px rgba(37,99,235,.15);
    }

    .produto-img {
      height: 240px;
      background: #f8fafc;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
    }

    .produto-img img {
      width: 100%;
      height: 100%;
      object-fit: contain;
      padding: 12px;
      transition: .3s;
    }

    .produto:hover img {
      transform: scale(1.06);
    }

    .produto-info {
      padding: 16px;
    }

    .categoria-produto {
      color: var(--roxo);
      font-size: 12px;
      font-weight: bold;
      text-transform: uppercase;
    }

    .produto h3 {
      margin: 7px 0;
      font-size: 16px;
      min-height: 38px;
    }

    .estrelas {
      color: #f59e0b;
      font-size: 14px;
    }

    .preco-antigo {
      color: #9ca3af;
      text-decoration: line-through;
      font-size: 13px;
      margin-top: 8px;
    }

    .preco {
      color: #111827;
      font-size: 23px;
      font-weight: 900;
      margin: 3px 0 12px;
    }

    .pix {
      color: var(--verde);
      font-size: 12px;
      font-weight: bold;
    }

    .btn-comprar {
      width: 100%;
      border: none;
      padding: 12px;
      border-radius: 10px;
      color: white;
      background: linear-gradient(135deg, var(--azul), var(--roxo));
      cursor: pointer;
      font-weight: bold;
      margin-top: 12px;
      transition: .2s;
    }

    .btn-comprar:hover {
      filter: brightness(1.1);
    }

    .badge {
      position: absolute;
      top: 12px;
      left: 12px;
      background: #ef4444;
      color: white;
      padding: 5px 9px;
      border-radius: 7px;
      font-size: 11px;
      font-weight: bold;
      z-index: 2;
    }

    /* BENEFÍCIOS */
    .beneficios {
      max-width: 1250px;
      margin: 10px auto 40px;
      padding: 0 20px;
      display: grid;
      grid-template-columns: repeat(4,1fr);
      gap: 15px;
    }

    .beneficio {
      background: white;
      padding: 20px;
      border-radius: 15px;
      display: flex;
      align-items: center;
      gap: 15px;
      box-shadow: 0 4px 15px rgba(0,0,0,.05);
    }

    .beneficio-icon {
      font-size: 30px;
    }

    .beneficio strong {
      display: block;
      margin-bottom: 4px;
    }

    .beneficio small {
      color: var(--cinza);
    }

    /* CARRINHO */
    .overlay {
      display: none;
      position: fixed;
      inset: 0;
      background: rgba(0,0,0,.55);
      z-index: 1999;
    }

    .overlay.ativo {
      display: block;
    }

    .carrinho {
      position: fixed;
      z-index: 2000;
      top: 0;
      right: -450px;
      width: min(450px, 100%);
      height: 100vh;
      background: white;
      transition: .3s;
      display: flex;
      flex-direction: column;
      box-shadow: -10px 0 40px rgba(0,0,0,.2);
    }

    .carrinho.aberto {
      right: 0;
    }

    .carrinho-topo {
      padding: 20px;
      background: linear-gradient(135deg, #111827, #312e81);
      color: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .fechar {
      border: none;
      background: rgba(255,255,255,.15);
      color: white;
      width: 35px;
      height: 35px;
      border-radius: 50%;
      cursor: pointer;
      font-size: 18px;
    }

    .itens-carrinho {
      flex: 1;
      overflow-y: auto;
      padding: 15px;
    }

    .item-carrinho {
      display: flex;
      gap: 12px;
      padding: 12px 0;
      border-bottom: 1px solid #eee;
    }

    .item-carrinho img {
      width: 70px;
      height: 70px;
      object-fit: contain;
      border-radius: 10px;
      background: #f5f5f5;
    }

    .item-info {
      flex: 1;
    }

    .item-info h4 {
      font-size: 14px;
      margin-bottom: 7px;
    }

    .item-preco {
      color: var(--roxo);
      font-weight: bold;
    }

    .quantidade {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-top: 8px;
    }

    .quantidade button {
      width: 25px;
      height: 25px;
      border: none;
      background: #eef2ff;
      color: #312e81;
      border-radius: 5px;
      cursor: pointer;
    }

    .remover {
      color: var(--vermelho);
      border: none;
      background: none;
      cursor: pointer;
      margin-top: 7px;
      font-size: 12px;
    }

    .carrinho-vazio {
      text-align: center;
      padding: 60px 20px;
      color: var(--cinza);
    }

    .carrinho-vazio div {
      font-size: 55px;
      margin-bottom: 15px;
    }

    .carrinho-rodape {
      padding: 18px;
      border-top: 1px solid #eee;
      background: #fafafa;
    }

    .subtotal {
      display: flex;
      justify-content: space-between;
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 14px;
    }

    .btn-finalizar,
    .btn-compartilhar {
      width: 100%;
      padding: 13px;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      font-weight: bold;
      margin-top: 8px;
    }

    .btn-finalizar {
      background: #16a34a;
      color: white;
    }

    .btn-compartilhar {
      background: #ede9fe;
      color: #5b21b6;
    }

    /* FOOTER */
    footer {
      background: #111827;
      color: white;
      padding: 45px 20px;
      margin-top: 20px;
    }

    .footer-container {
      max-width: 1250px;
      margin: auto;
      display: grid;
      grid-template-columns: 2fr 1fr 1fr 1fr;
      gap: 30px;
    }

    footer h3 {
      margin-bottom: 15px;
    }

    footer p,
    footer li {
      color: #9ca3af;
      line-height: 1.8;
      list-style: none;
    }

    .copyright {
      max-width: 1250px;
      margin: 35px auto 0;
      padding-top: 20px;
      border-top: 1px solid #374151;
      color: #9ca3af;
      font-size: 13px;
    }

    /* RESPONSIVO */
    @media (max-width: 1000px) {
      .produtos {
        grid-template-columns: repeat(3, 1fr);
      }

      .beneficios {
        grid-template-columns: repeat(2,1fr);
      }
    }

    @media (max-width: 750px) {
      .topo {
        flex-wrap: wrap;
      }

      .logo {
        font-size: 23px;
      }

      .busca {
        order: 3;
        flex-basis: 100%;
      }

      .banner {
        padding: 35px 25px;
        min-height: 300px;
      }

      .produtos {
        grid-template-columns: repeat(2, 1fr);
        gap: 12px;
      }

      .produto-img {
        height: 190px;
      }

      .produto-info {
        padding: 12px;
      }

      .produto h3 {
        font-size: 14px;
      }

      .preco {
        font-size: 19px;
      }

      .beneficios {
        grid-template-columns: 1fr;
      }

      .footer-container {
        grid-template-columns: 1fr 1fr;
      }
    }

    @media (max-width: 480px) {
      .produtos {
        grid-template-columns: repeat(2, 1fr);
      }

      .produto-img {
        height: 160px;
      }

      .titulo-secao {
        align-items: flex-start;
        flex-direction: column;
      }

      .footer-container {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>

<body>

<header>
  <div class="topo">

    <div class="logo">
      Nova<span>Mix</span>
    </div>

    <div class="busca">
      <input
        type="text"
        id="campoBusca"
        placeholder="O que você está procurando?"
        oninput="buscarProdutos()"
      >
      <span class="icone-busca">🔍</span>
    </div>

    <div class="acoes">
      <button class="btn-carrinho" onclick="abrirCarrinho()">
        🛒 Carrinho
        <span id="contadorCarrinho">0</span>
      </button>
    </div>

  </div>
</header>

<nav class="categorias">
  <div class="categorias-container">

    <button class="categoria ativa" onclick="filtrarCategoria('Todos', this)">
      Todos
    </button>

    <button class="categoria" onclick="filtrarCategoria('Perfumes', this)">
      🌸 Perfumes
    </button>

    <button class="categoria" onclick="filtrarCategoria('Celulares', this)">
      📱 Celulares
    </button>

    <button class="categoria" onclick="filtrarCategoria('Eletrônicos', this)">
      🎧 Eletrônicos
    </button>

    <button class="categoria" onclick="filtrarCategoria('Eletrodomésticos', this)">
      🏠 Eletrodomésticos
    </button>

  </div>
</nav>

<section class="hero">

  <div class="banner">

    <div class="banner-texto">

      <h1>
        Tecnologia,<br>
        <span>perfumes & muito mais.</span>
      </h1>

      <p>
        Produtos selecionados, preços especiais e novidades
        todos os dias na NovaMix.
      </p>

      <button
        class="btn-banner"
        onclick="document.getElementById('produtos').scrollIntoView({behavior:'smooth'})"
      >
        Comprar agora →
      </button>

    </div>

  </div>

</section>

<section class="beneficios">

  <div class="beneficio">
    <div class="beneficio-icon">🚚</div>
    <div>
      <strong>Envio rápido</strong>
      <small>Enviamos para todo Brasil</small>
    </div>
  </div>

  <div class="beneficio">
    <div class="beneficio-icon">🔒</div>
    <div>
      <strong>Compra segura</strong>
      <small>Seus dados protegidos</small>
    </div>
  </div>

  <div class="beneficio">
    <div class="beneficio-icon">💳</div>
    <div>
      <strong>Pagamento fácil</strong>
      <small>Pix e cartão</small>
    </div>
  </div>

  <div class="beneficio">
    <div class="beneficio-icon">⭐</div>
    <div>
      <strong>Produtos selecionados</strong>
      <small>Qualidade e variedade</small>
    </div>
  </div>

</section>

<main class="container" id="produtos">

  <div class="titulo-secao">

    <div>
      <h2>🔥 Produtos em destaque</h2>
      <p style="color:#6b7280;margin-top:5px">
        Encontre seus próximos favoritos
      </p>
    </div>

    <select class="ordenacao" onchange="ordenarProdutos(this.value)">
      <option value="padrao">Mais relevantes</option>
      <option value="menor">Menor preço</option>
      <option value="maior">Maior preço</option>
    </select>

  </div>

  <div class="produtos" id="listaProdutos"></div>

</main>

<!-- CARRINHO -->

<div class="overlay" id="overlay" onclick="fecharCarrinho()"></div>

<aside class="carrinho" id="carrinho">

  <div class="carrinho-topo">

    <div>
      <h2>🛒 Meu Carrinho</h2>
      <small>Confira seus produtos</small>
    </div>

    <button class="fechar" onclick="fecharCarrinho()">×</button>

  </div>

  <div class="itens-carrinho" id="itensCarrinho"></div>

  <div class="carrinho-rodape">

    <div class="subtotal">
      <span>Total</span>
      <span id="totalCarrinho">R$ 0,00</span>
    </div>

    <button class="btn-finalizar" onclick="finalizarPedido()">
      💬 Finalizar pedido pelo WhatsApp
    </button>

    <button class="btn-compartilhar" onclick="compartilharCarrinho()">
      🔗 Compartilhar carrinho
    </button>

  </div>

</aside>

<footer>

  <div class="footer-container">

    <div>
      <h3>NovaMix</h3>
      <p>
        Perfumes importados, celulares, eletrônicos
        e eletrodomésticos em um só lugar.
      </p>
    </div>

    <div>
      <h3>Comprar</h3>
      <ul>
        <li>Perfumes</li>
        <li>Celulares</li>
        <li>Eletrônicos</li>
        <li>Eletrodomésticos</li>
      </ul>
    </div>

    <div>
      <h3>Atendimento</h3>
      <ul>
        <li>WhatsApp</li>
        <li>Instagram</li>
        <li>Política de troca</li>
        <li>Privacidade</li>
      </ul>
    </div>

    <div>
      <h3>Pagamento</h3>
      <p>💳 Cartão</p>
      <p>💚 Pix</p>
      <p>🔒 Compra segura</p>
    </div>

  </div>

  <div class="copyright">
    ©️ 2026 NovaMix — Todos os direitos reservados.
  </div>

</footer>

<script>

  /* ==========================================
     CONFIGURAÇÕES
  ========================================== */

  /*
    COLOQUE AQUI O SEU WHATSAPP.

    Exemplo:
    5511970218569

    Não coloque +, espaços ou parênteses.
  */

  const WHATSAPP = "5511970218569";


  /* ==========================================
     PRODUTOS
  ========================================== */

  const produtos = [

    {
      id: 1,
      nome: "Apple iPhone 16 128GB",
      categoria: "Celulares",
      preco: 4599.90,
      antigo: 5299.90,
      nota: 5,
      imagem: "https://images.unsplash.com/photo-1592286927505-2fd0d6f3a5b9?auto=format&fit=crop&w=700&q=80",
      badge: "OFERTA"
    },

    {
      id: 2,
      nome: "Samsung Galaxy S25",
      categoria: "Celulares",
      preco: 3999.90,
      antigo: 4499.90,
      nota: 5,
      imagem: "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?auto=format&fit=crop&w=700&q=80",
      badge: "NOVO"
    },

    {
      id: 3,
      nome: "Xiaomi Redmi Note 14",
      categoria: "Celulares",
      preco: 1599.90,
      antigo: 1899.90,
      nota: 4,
      imagem: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=700&q=80",
      badge: "OFERTA"
    },

    {
      id: 4,
      nome: "Dior Sauvage Eau de Parfum",
      categoria: "Perfumes",
      preco: 769.90,
      antigo: 899.90,
      nota: 5,
      imagem: "https://images.unsplash.com/photo-1594035910387-fea47794261f?auto=format&fit=crop&w=700&q=80",
      badge: "TOP"
    },

    {
      id: 5,
      nome: "Carolina Herrera Good Girl",
      categoria: "Perfumes",
      preco: 580.00,
      antigo: 699.90,
      nota: 5,
      imagem: "https://images.unsplash.com/photo-1541643600914-78b084683601?auto=format&fit=crop&w=700&q=80",
      badge: "OFERTA"
    },

    {
      id: 6,
      nome: "Paco Rabanne 1 Million",
      categoria: "Perfumes",
      preco: 499.90,
      antigo: 599.90,
      nota: 5,
      imagem: "https://images.unsplash.com/photo-1592945403244-b3fbafd7f539?auto=format&fit=crop&w=700&q=80",
      badge: "TOP"
    },

    {
      id: 7,
      nome: "Apple AirPods Pro",
      categoria: "Eletrônicos",
      preco: 1699.00,
      antigo: 1999.90,
      nota: 5,
      imagem: "https://images.unsplash.com/photo-1588423771073-b8903fbb85b5?auto=format&fit=crop&w=700&q=80",
      badge: "OFERTA"
    },

    {
      id: 8,
      nome: "PlayStation 5 Slim",
      categoria: "Eletrônicos",
      preco: 4299.90,
      antigo: 4799.90,
      nota: 5,
      imagem: "https://images.unsplash.com/photo-1606813907291-d86efa9b94db?auto=format&fit=crop&w=700&q=80",
      badge: "TOP"
    },

    {
      id: 9,
      nome: "Apple Watch Series",
      categoria: "Eletrônicos",
      preco: 2199.90,
      antigo: 2599.90,
      nota: 4,
      imagem: "https://images.unsplash.com/photo-1544117519-31a4b719223d?auto=format&fit=crop&w=700&q=80",
      badge: "NOVO"
    },

    {
      id: 10,
      nome: "Smart TV 50\" 4K",
      categoria: "Eletrodomésticos",
      preco: 2349.90,
      antigo: 2799.90,
      nota: 5,
      imagem: "https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?auto=format&fit=crop&w=700&q=80",
      badge: "OFERTA"
    },

    {
      id: 11,
      nome: "Air Fryer Digital 5L",
      categoria: "Eletrodomésticos",
      preco: 399.90,
      antigo: 499.90,
      nota: 5,
      imagem: "https://images.unsplash.com/photo-1585515320310-259814833e62?auto=format&fit=crop&w=700&q=80",
      badge: "OFERTA"
    },

    {
      id: 12,
      nome: "Robô Aspirador Inteligente",
      categoria: "Eletrodomésticos",
      preco: 899.90,
      antigo: 1099.90,
      nota: 4,
      imagem: "https://images.unsplash.com/photo-1585771724684-38269d6639fd?auto=format&fit=crop&w=700&q=80",
      badge: "NOVO"
    }

  ];


  /* ==========================================
     ESTADO
  ========================================== */

  let carrinho = JSON.parse(
    localStorage.getItem("novamix_carrinho") || "[]"
  );

  let categoriaAtual = "Todos";
  let buscaAtual = "";


  /* ==========================================
     FORMATAÇÃO
  ========================================== */

  function dinheiro(valor) {

    return valor.toLocaleString("pt-BR", {
      style: "currency",
      currency: "BRL"
    });

  }


  /* ==========================================
     RENDER PRODUTOS
  ========================================== */

  function renderProdutos(lista = produtos) {

    const container = document.getElementById("listaProdutos");

    if (!lista.length) {

      container.innerHTML = `
        <div style="
          grid-column:1/-1;
          text-align:center;
          padding:60px;
          background:white;
          border-radius:20px;
        ">
          <div style="font-size:50px">🔎</div>
          <h3>Nenhum produto encontrado</h3>
          <p style="color:#6b7280;margin-top:8px">
            Tente procurar por outro produto.
          </p>
        </div>
      `;

      return;
    }

    container.innerHTML = lista.map(produto => `

      <article class="produto">

        ${produto.badge
          ? <span class="badge">${produto.badge}</span>
          : ""
        }

        <div class="produto-img">

          <img
            src="${produto.imagem}"
            alt="${produto.nome}"
            loading="lazy"
            onerror="this.src='https://placehold.co/600x600/eee/555?text=Produto'"
          >

        </div>

        <div class="produto-info">

          <div class="categoria-produto">
            ${produto.categoria}
          </div>

          <h3>${produto.nome}</h3>

          <div class="estrelas">
            ${"★".repeat(produto.nota)}
            ${"☆".repeat(5 - produto.nota)}
          </div>

          <div class="preco-antigo">
            ${dinheiro(produto.antigo)}
          </div>

          <div class="preco">
            ${dinheiro(produto.preco)}
          </div>

          <div class="pix">
            💚 À vista no Pix
          </div>

          <button
            class="btn-comprar"
            onclick="adicionarCarrinho(${produto.id})"
          >
            🛒 Adicionar ao carrinho
          </button>

        </div>

      </article>

    `).join("");

  }


  /* ==========================================
     FILTRO
  ========================================== */

  function filtrarCategoria(categoria, botao) {

    categoriaAtual = categoria;

    document.querySelectorAll(".categoria").forEach(btn => {
      btn.classList.remove("ativa");
    });

    botao.classList.add("ativa");

    aplicarFiltros();

  }


  function buscarProdutos() {

    buscaAtual =
      document.getElementById("campoBusca").value.toLowerCase();

    aplicarFiltros();

  }


  function aplicarFiltros() {

    let lista = produtos.filter(produto => {

      const categoriaOk =
        categoriaAtual === "Todos" ||
        produto.categoria === categoriaAtual;

      const buscaOk =
        produto.nome.toLowerCase().includes(buscaAtual) ||
        produto.categoria.toLowerCase().includes(buscaAtual);

      return categoriaOk && buscaOk;

    });

    renderProdutos(lista);

  }


  /* ==========================================
     ORDENAÇÃO
  ========================================== */

  function ordenarProdutos(tipo) {

    let lista = produtos.filter(produto => {

      const categoriaOk =
        categoriaAtual === "Todos" ||
        produto.categoria === categoriaAtual;

      const buscaOk =
        produto.nome.toLowerCase().includes(buscaAtual) ||
        produto.categoria.toLowerCase().includes(buscaAtual);

      return categoriaOk && buscaOk;

    });

    if (tipo === "menor") {

      lista.sort((a,b) => a.preco - b.preco);

    }

    if (tipo === "maior") {

      lista.sort((a,b) => b.preco - a.preco);

    }

    renderProdutos(lista);

  }


  /* ==========================================
     CARRINHO
  ========================================== */

  function salvarCarrinho() {

    localStorage.setItem(
      "novamix_carrinho",
      JSON.stringify(carrinho)
    );

  }


  function adicionarCarrinho(id) {

    const existente = carrinho.find(item => item.id === id);

    if (existente) {

      existente.quantidade++;

    } else {

      carrinho.push({
        id: id,
        quantidade: 1
      });

    }

    salvarCarrinho();
    atualizarCarrinho();
    abrirCarrinho();

  }


  function alterarQuantidade(id, quantidade) {

    const item = carrinho.find(item => item.id === id);

    if (!item) return;

    item.quantidade += quantidade;

    if (item.quantidade <= 0) {

      carrinho =
        carrinho.filter(item => item.id !== id);

    }

    salvarCarrinho();
    atualizarCarrinho();

  }


  function removerProduto(id) {

    carrinho =
      carrinho.filter(item => item.id !== id);

    salvarCarrinho();
    atualizarCarrinho();

  }


  function atualizarCarrinho() {

    const container =
      document.getElementById("itensCarrinho");

    const contador =
      document.getElementById("contadorCarrinho");

    const totalElemento =
      document.getElementById("totalCarrinho");

    let quantidadeTotal = 0;
    let total = 0;

    carrinho.forEach(item => {

      const produto =
        produtos.find(p => p.id === item.id);

      if (!produto) return;

      quantidadeTotal += item.quantidade;

      total +=
        produto.preco * item.quantidade;

    });

    contador.textContent = quantidadeTotal;

    totalElemento.textContent =
      dinheiro(total);

    if (!carrinho.length) {

      container.innerHTML = `
        <div class="carrinho-vazio">

          <div>🛒</div>

          <h3>Seu carrinho está vazio</h3>

          <p style="margin-top:8px">
            Adicione produtos para começar.
          </p>

        </div>
      `;

      return;

    }

    container.innerHTML =
      carrinho.map(item => {

        const produto =
          produtos.find(p => p.id === item.id);

        if (!produto) return "";

        return `

          <div class="item-carrinho">

            <img
              src="${produto.imagem}"
              alt="${produto.nome}"
            >

            <div class="item-info">

              <h4>${produto.nome}</h4>

              <div class="item-preco">
                ${dinheiro(produto.preco)}
              </div>

              <div class="quantidade">

                <button
                  onclick="alterarQuantidade(${produto.id}, -1)"
                >
                  −
                </button>

                <strong>
                  ${item.quantidade}
                </strong>

                <button
                  onclick="alterarQuantidade(${produto.id}, 1)"
                >
                  +
                </button>

              </div>

              <button
                class="remover"
                onclick="removerProduto(${produto.id})"
              >
                Remover
              </button>

            </div>

          </div>

        `;

      }).join("");

  }


  /* ==========================================
     ABRIR / FECHAR CARRINHO
  ========================================== */

  function abrirCarrinho() {

    document
      .getElementById("carrinho")
      .classList.add("aberto");

    document
      .getElementById("overlay")
      .classList.add("ativo");

  }


  function fecharCarrinho() {

    document
      .getElementById("carrinho")
      .classList.remove("aberto");

    document
      .getElementById("overlay")
      .classList.remove("ativo");

  }


  /* ==========================================
     COMPARTILHAR CARRINHO
  ========================================== */

  function compartilharCarrinho() {

    if (!carrinho.length) {

      alert("Seu carrinho está vazio.");

      return;

    }

    /*
      Transformamos o carrinho em texto
      para colocar dentro da URL.
    */

    const dados =
      btoa(
        encodeURIComponent(
          JSON.stringify(carrinho)
        )
      );

    const url =
      window.location.origin +
      window.location.pathname +
      "?carrinho=" +
      encodeURIComponent(dados);

    if (navigator.share) {

      navigator.share({
        title: "Meu carrinho NovaMix",
        text: "Confira meu carrinho na NovaMix!",
        url: url
      });

    } else {

      navigator.clipboard.writeText(url);

      alert(
        "Link do carrinho copiado! Agora é só enviar para a pessoa."
      );

    }

  }


  /* ==========================================
     CARREGAR CARRINHO DO LINK
  ========================================== */

  function carregarCarrinhoDoLink() {

    const parametros =
      new URLSearchParams(window.location.search);

    const dados =
      parametros.get("carrinho");

    if (!dados) return;

    try {

      const novoCarrinho =
        JSON.parse(
          decodeURIComponent(
            atob(decodeURIComponent(dados))
          )
        );

      if (Array.isArray(novoCarrinho)) {

        carrinho = novoCarrinho;

        salvarCarrinho();
        atualizarCarrinho();

        setTimeout(() => {

          alert(
            "🛒 Carrinho compartilhado carregado com sucesso!"
          );

          abrirCarrinho();

        }, 500);

      }

    } catch (erro) {

      console.error(
        "Não foi possível carregar o carrinho:",
        erro
      );

    }

  }


  /* ==========================================
     WHATSAPP
  ========================================== */

  function finalizarPedido() {

    if (!carrinho.length) {

      alert("Seu carrinho está vazio.");

      return;

    }

    let mensagem =
      "Olá! Quero fazer um pedido na NovaMix.%0A%0A";

    let total = 0;

    carrinho.forEach(item => {

      const produto =
        produtos.find(p => p.id === item.id);

      if (!produto) return;

      const subtotal =
        produto.preco * item.quantidade;

      total += subtotal;

      mensagem +=
        • ${produto.nome} x${item.quantidade} — ${dinheiro(subtotal)}%0A;

    });

    mensagem +=
      %0A*Total: ${dinheiro(total)}*;

    const url =
      https://wa.me/${WHATSAPP}?text=${mensagem};

    window.open(url, "_blank");

  }


  /* ==========================================
     INICIALIZAÇÃO
  ========================================== */

  renderProdutos();

  atualizarCarrinho();

  carregarCarrinhoDoLink();

</script>

</body>
</html>
