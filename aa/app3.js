(() => {
    "use strict";
    var e,
        a,
        t,
        r,
        d,
        c = {},
        f = {};
    function o(e) {
        var a = f[e];
        if (void 0 !== a) return a.exports;
        var t = (f[e] = { exports: {} });
        return c[e].call(t.exports, t, t.exports, o), t.exports;
    }
    (o.m = c),
        (o.amdO = {}),
        (e = []),
        (o.O = (a, t, r, d) => {
            if (!t) {
                var c = 1 / 0;
                for (i = 0; i < e.length; i++) {
                    (t = e[i][0]), (r = e[i][1]), (d = e[i][2]);
                    for (var f = !0, n = 0; n < t.length; n++)
                        (!1 & d || c >= d) &&
                        Object.keys(o.O).every((e) => o.O[e](t[n]))
                            ? t.splice(n--, 1)
                            : ((f = !1), d < c && (c = d));
                    if (f) {
                        e.splice(i--, 1);
                        var b = r();
                        void 0 !== b && (a = b);
                    }
                }
                return a;
            }
            d = d || 0;
            for (var i = e.length; i > 0 && e[i - 1][2] > d; i--)
                e[i] = e[i - 1];
            e[i] = [t, r, d];
        }),
        (o.F = {}),
        (o.E = (e) => {
            Object.keys(o.F).map((a) => {
                o.F[a](e);
            });
        }),
        (o.n = (e) => {
            var a = e && e.__esModule ? () => e.default : () => e;
            return o.d(a, { a }), a;
        }),
        (t = Object.getPrototypeOf
            ? (e) => Object.getPrototypeOf(e)
            : (e) => e.__proto__),
        (o.t = function (e, r) {
            if ((1 & r && (e = this(e)), 8 & r)) return e;
            if ("object" == typeof e && e) {
                if (4 & r && e.__esModule) return e;
                if (16 & r && "function" == typeof e.then) return e;
            }
            var d = Object.create(null);
            o.r(d);
            var c = {};
            a = a || [null, t({}), t([]), t(t)];
            for (
                var f = 2 & r && e;
                "object" == typeof f && !~a.indexOf(f);
                f = t(f)
            )
                Object.getOwnPropertyNames(f).forEach(
                    (a) => (c[a] = () => e[a])
                );
            return (c.default = () => e), o.d(d, c), d;
        }),
        (o.d = (e, a) => {
            for (var t in a)
                o.o(a, t) &&
                    !o.o(e, t) &&
                    Object.defineProperty(e, t, { enumerable: !0, get: a[t] });
        }),
        (o.f = {}),
        (o.e = (e) =>
            Promise.all(
                Object.keys(o.f).reduce((a, t) => (o.f[t](e, a), a), [])
            )),
        (o.u = (e) =>
            (653 === e ? "videojs" : e) +
            "." +
            {
                75: "5b4852f",
                83: "52fd0d1",
                102: "7a5702a",
                151: "c3aad8d",
                157: "eb60083",
                192: "8ea7fce",
                201: "d87fdd6",
                223: "09d1b9e",
                477: "8d8c62b",
                569: "59910fe",
                593: "5a145f0",
                653: "3895548",
                693: "bea179f",
                745: "02d2185",
                855: "101adc5",
                898: "a2fde34",
                967: "44225dc",
                1018: "a4dfe4b",
                1069: "e14a6e1",
                1182: "ea2a25a",
                1248: "a5db107",
                1300: "a6a8e86",
                1331: "80df5e2",
                1391: "5e8a375",
                1522: "b47be35",
                1611: "b91bfb8",
                1619: "1bc8845",
                1652: "0a785f7",
                1655: "477f6a3",
                1713: "18f799d",
                1737: "10d61aa",
                1753: "7af7268",
                1776: "18fcfcf",
                1794: "44f89f3",
                1832: "79a0ae2",
                1890: "51923ac",
                2009: "45670ea",
                2045: "c98a130",
                2257: "80ffdee",
                2323: "fc3772a",
                2358: "e0cf3c1",
                2450: "5042fff",
                2452: "8cf0c32",
                2464: "ae27e5b",
                2466: "cb7ea4c",
                2476: "518b7e6",
                2485: "aa1654b",
                2534: "6df645a",
                2563: "339e079",
                2593: "dc766cc",
                2605: "3fbcb87",
                2702: "73c581b",
                2725: "b0da4d3",
                2787: "06f5040",
                2914: "07ac49a",
                3021: "af9416a",
                3030: "c56af3e",
                3057: "1f995a8",
                3070: "4ba402c",
                3129: "3e3a9fa",
                3145: "63a7755",
                3176: "f82114d",
                3198: "c11e820",
                3210: "229b6af",
                3257: "b3978ef",
                3417: "e3fbd6f",
                3670: "7f67bcd",
                3831: "6001e11",
                3896: "428fe9c",
                3927: "13a774a",
                3997: "d384d3c",
                4114: "aa99147",
                4135: "d804cb3",
                4162: "199f91d",
                4196: "1d2f3a3",
                4208: "da27364",
                4212: "b2ee9ea",
                4214: "3f41cb0",
                4318: "65545a1",
                4459: "6ad9517",
                4533: "55508d3",
                4558: "dea3f3e",
                4586: "b2b684b",
                4591: "118b796",
                4790: "d3f89c9",
                4811: "370721b",
                4890: "133fed8",
                4918: "2923665",
                5137: "6904c08",
                5164: "bd6d9ad",
                5267: "764abca",
                5272: "21e1717",
                5304: "cc15740",
                5383: "b1594c8",
                5405: "9c339a8",
                5408: "2a24552",
                5486: "514643a",
                5488: "6f10c92",
                5504: "cfd4057",
                5508: "31b962a",
                5620: "7f2ec09",
                5678: "363af33",
                5683: "552a415",
                5686: "f84ca66",
                5704: "cccc7ec",
                5710: "d184298",
                5722: "f770cfb",
                5752: "e1d803b",
                5798: "60a86a9",
                5815: "ae6a91a",
                5831: "59c4242",
                5895: "35a2e43",
                5956: "265ad8a",
                6016: "12bf063",
                6137: "5cd41ea",
                6173: "d896eb0",
                6175: "2ff15ac",
                6249: "cbdbe36",
                6283: "7e4cd1f",
                6299: "6ef61b3",
                6320: "36116ae",
                6373: "dfa1060",
                6408: "33019f1",
                6582: "90bf2bb",
                6642: "79294f9",
                6695: "e85daef",
                6722: "761e40d",
                6739: "b4d6d4e",
                6786: "dccf4c5",
                6806: "f572dfb",
                6895: "1d0a38a",
                7038: "99598a2",
                7278: "6ff1fd3",
                7308: "68f71d0",
                7353: "33298e9",
                7370: "6ccfd33",
                7387: "205748c",
                7632: "4c06969",
                7673: "c80180c",
                7961: "dd78176",
                8013: "8ae3576",
                8050: "2d7c1a2",
                8065: "9e79dc7",
                8188: "21c3a5b",
                8267: "34dc460",
                8295: "bccae39",
                8415: "17fc2bf",
                8418: "8e4c93c",
                8452: "51557db",
                8463: "53971f7",
                8495: "8082304",
                8537: "65f9c67",
                8539: "d40df5d",
                8595: "31988fe",
                8702: "072b676",
                8739: "85aa1b4",
                8972: "0d0b030",
                9010: "7c05282",
                9103: "eb515ca",
                9121: "c1b22c3",
                9146: "843a025",
                9195: "06ee336",
                9248: "6164a14",
                9296: "39669cd",
                9298: "2cad673",
                9314: "c058c12",
                9322: "3c27223",
                9414: "cd9a413",
                9637: "4864f5b",
                9713: "a3aae01",
                9759: "8f145d1",
                9796: "c71a8b9",
                9800: "aeeeea8",
                9870: "1e0e5bb",
                9911: "67245d6",
            }[e] +
            ".js"),
        (o.miniCssF = (e) =>
            e +
            "." +
            {
                192: "344c3eb",
                1018: "e17154c",
                1611: "c1a39f7",
                1753: "d7d20b5",
                2358: "d7d20b5",
                2476: "6457279",
                2605: "d7d20b5",
                2702: "d7d20b5",
                3896: "d7d20b5",
                4212: "d7d20b5",
                6299: "d7d20b5",
                6786: "d7d20b5",
                7038: "d7d20b5",
                7387: "d7d20b5",
                8702: "e17154c",
                8972: "d7d20b5",
                9121: "d7d20b5",
                9296: "d7d20b5",
                9414: "d7d20b5",
                9796: "c1a39f7",
            }[e] +
            ".css"),
        (o.g = (function () {
            if ("object" == typeof globalThis) return globalThis;
            try {
                return this || new Function("return this")();
            } catch (e) {
                if ("object" == typeof window) return window;
            }
        })()),
        (o.o = (e, a) => Object.prototype.hasOwnProperty.call(e, a)),
        (r = {}),
        (d = "microblog:"),
        (o.l = (e, a, t, c) => {
            if (r[e]) r[e].push(a);
            else {
                var f, n;
                if (void 0 !== t)
                    for (
                        var b = document.getElementsByTagName("script"), i = 0;
                        i < b.length;
                        i++
                    ) {
                        var l = b[i];
                        if (
                            l.getAttribute("src") == e ||
                            l.getAttribute("data-webpack") == d + t
                        ) {
                            f = l;
                            break;
                        }
                    }
                f ||
                    ((n = !0),
                    ((f = document.createElement("script")).charset = "utf-8"),
                    (f.timeout = 120),
                    o.nc && f.setAttribute("nonce", o.nc),
                    f.setAttribute("data-webpack", d + t),
                    (f.src = e)),
                    (r[e] = [a]);
                var u = (a, t) => {
                        (f.onerror = f.onload = null), clearTimeout(s);
                        var d = r[e];
                        if (
                            (delete r[e],
                            f.parentNode && f.parentNode.removeChild(f),
                            d && d.forEach((e) => e(t)),
                            a)
                        )
                            return a(t);
                    },
                    s = setTimeout(
                        u.bind(null, void 0, { type: "timeout", target: f }),
                        12e4
                    );
                (f.onerror = u.bind(null, f.onerror)),
                    (f.onload = u.bind(null, f.onload)),
                    n && document.head.appendChild(f);
            }
        }),
        (o.r = (e) => {
            "undefined" != typeof Symbol &&
                Symbol.toStringTag &&
                Object.defineProperty(e, Symbol.toStringTag, {
                    value: "Module",
                }),
                Object.defineProperty(e, "__esModule", { value: !0 });
        }),
        (o.p = "/"),
        (() => {
            if ("undefined" != typeof document) {
                var e = { 3666: 0 };
                o.f.miniCss = (a, t) => {
                    e[a]
                        ? t.push(e[a])
                        : 0 !== e[a] &&
                          {
                              192: 1,
                              1018: 1,
                              1611: 1,
                              1753: 1,
                              2358: 1,
                              2476: 1,
                              2605: 1,
                              2702: 1,
                              3896: 1,
                              4212: 1,
                              6299: 1,
                              6786: 1,
                              7038: 1,
                              7387: 1,
                              8702: 1,
                              8972: 1,
                              9121: 1,
                              9296: 1,
                              9414: 1,
                              9796: 1,
                          }[a] &&
                          t.push(
                              (e[a] = ((e) =>
                                  new Promise((a, t) => {
                                      var r = o.miniCssF(e),
                                          d = o.p + r;
                                      if (
                                          ((e, a) => {
                                              for (
                                                  var t =
                                                          document.getElementsByTagName(
                                                              "link"
                                                          ),
                                                      r = 0;
                                                  r < t.length;
                                                  r++
                                              ) {
                                                  var d =
                                                      (f = t[r]).getAttribute(
                                                          "data-href"
                                                      ) ||
                                                      f.getAttribute("href");
                                                  if (
                                                      "stylesheet" === f.rel &&
                                                      (d === e || d === a)
                                                  )
                                                      return f;
                                              }
                                              var c =
                                                  document.getElementsByTagName(
                                                      "style"
                                                  );
                                              for (r = 0; r < c.length; r++) {
                                                  var f;
                                                  if (
                                                      (d = (f =
                                                          c[r]).getAttribute(
                                                          "data-href"
                                                      )) === e ||
                                                      d === a
                                                  )
                                                      return f;
                                              }
                                          })(r, d)
                                      )
                                          return a();
                                      ((e, a, t, r, d) => {
                                          var c =
                                              document.createElement("link");
                                          (c.rel = "stylesheet"),
                                              (c.type = "text/css"),
                                              (c.onerror = c.onload =
                                                  (t) => {
                                                      if (
                                                          ((c.onerror =
                                                              c.onload =
                                                                  null),
                                                          "load" === t.type)
                                                      )
                                                          r();
                                                      else {
                                                          var f =
                                                                  t &&
                                                                  ("load" ===
                                                                  t.type
                                                                      ? "missing"
                                                                      : t.type),
                                                              o =
                                                                  (t &&
                                                                      t.target &&
                                                                      t.target
                                                                          .href) ||
                                                                  a,
                                                              n = new Error(
                                                                  "Loading CSS chunk " +
                                                                      e +
                                                                      " failed.\n(" +
                                                                      o +
                                                                      ")"
                                                              );
                                                          (n.code =
                                                              "CSS_CHUNK_LOAD_FAILED"),
                                                              (n.type = f),
                                                              (n.request = o),
                                                              c.parentNode &&
                                                                  c.parentNode.removeChild(
                                                                      c
                                                                  ),
                                                              d(n);
                                                      }
                                                  }),
                                              (c.href = a),
                                              document.head.appendChild(c);
                                      })(e, d, 0, a, t);
                                  }))(a).then(
                                  () => {
                                      e[a] = 0;
                                  },
                                  (t) => {
                                      throw (delete e[a], t);
                                  }
                              ))
                          );
                };
            }
        })(),
        (() => {
            o.b = document.baseURI || self.location.href;
            var e = { 3666: 0 };
            (o.f.j = (a, t) => {
                var r = o.o(e, a) ? e[a] : void 0;
                if (0 !== r)
                    if (r) t.push(r[2]);
                    else if (/^(247|366)6$/.test(a)) e[a] = 0;
                    else {
                        var d = new Promise((t, d) => (r = e[a] = [t, d]));
                        t.push((r[2] = d));
                        var c = o.p + o.u(a),
                            f = new Error();
                        o.l(
                            c,
                            (t) => {
                                if (
                                    o.o(e, a) &&
                                    (0 !== (r = e[a]) && (e[a] = void 0), r)
                                ) {
                                    var d =
                                            t &&
                                            ("load" === t.type
                                                ? "missing"
                                                : t.type),
                                        c = t && t.target && t.target.src;
                                    (f.message =
                                        "Loading chunk " +
                                        a +
                                        " failed.\n(" +
                                        d +
                                        ": " +
                                        c +
                                        ")"),
                                        (f.name = "ChunkLoadError"),
                                        (f.type = d),
                                        (f.request = c),
                                        r[1](f);
                                }
                            },
                            "chunk-" + a,
                            a
                        );
                    }
            }),
                (o.F.j = (a) => {
                    if (
                        !(
                            (o.o(e, a) && void 0 !== e[a]) ||
                            /^(247|366)6$/.test(a)
                        )
                    ) {
                        e[a] = null;
                        var t = document.createElement("link");
                        o.nc && t.setAttribute("nonce", o.nc),
                            (t.rel = "prefetch"),
                            (t.as = "script"),
                            (t.href = o.p + o.u(a)),
                            document.head.appendChild(t);
                    }
                }),
                (o.O.j = (a) => 0 === e[a]);
            var a = (a, t) => {
                    var r,
                        d,
                        c = t[0],
                        f = t[1],
                        n = t[2],
                        b = 0;
                    if (c.some((a) => 0 !== e[a])) {
                        for (r in f) o.o(f, r) && (o.m[r] = f[r]);
                        if (n) var i = n(o);
                    }
                    for (a && a(t); b < c.length; b++)
                        (d = c[b]), o.o(e, d) && e[d] && e[d][0](), (e[d] = 0);
                    return o.O(i);
                },
                t = (self.webpackChunkmicroblog =
                    self.webpackChunkmicroblog || []);
            t.forEach(a.bind(null, 0)), (t.push = a.bind(null, t.push.bind(t)));
        })();
})();
