# 🎓 Logo Institucional

## Ubicación
Coloca el logo de tu universidad en esta carpeta: `public/images/logo/`

## Nombre del Archivo
**IMPORTANTE**: El archivo debe llamarse exactamente:
```
university-logo.png
```

O también puede ser:
```
university-logo.svg
```

## Especificaciones

### Tamaño Recomendado
- **Ancho**: 150-200 píxeles
- **Alto**: 40-60 píxeles (proporcional)
- El logo se ajustará automáticamente en el Navbar

### Formato
- **PNG con fondo transparente** (RECOMENDADO)
- SVG (ideal para calidad en cualquier tamaño)
- JPG solo si el logo tiene fondo blanco

### Calidad
- Resolución: 72-150 DPI
- Fondo transparente (PNG/SVG)
- Logo oficial de la universidad
- Preferiblemente versión horizontal

## Ruta Configurada en el Código

El código busca el logo en:
```
/images/logo/university-logo.png
```

Si usas otro nombre o formato, actualiza la ruta en:
`app/components/navbar.tsx` línea donde dice `src="/images/logo/university-logo.png"`

## Ejemplo de Estructura

```
public/images/logo/
└── university-logo.png  ← Tu logo aquí
```

## Alternativa: Logo SVG

Si tienes el logo en formato SVG (recomendado para mejor calidad):
```
public/images/logo/
└── university-logo.svg
```

Y actualiza en `navbar.tsx`:
```tsx
src="/images/logo/university-logo.svg"
```

## ¿No tienes el logo aún?

El sitio mostrará el nombre de la universidad como texto mientras tanto.
El diseño está preparado para funcionar con o sin logo.

¡Una vez agregado el logo, aparecerá automáticamente en el Navbar! 🚀
